import gzip
import socket
from datetime import UTC, datetime
from pathlib import Path

import typer

# TODO: Take all the possible encodings into account
converters = {b"": lambda x: x, b"gzip": gzip.decompress}


def send_and_save(
    first_response: bytes,
    connection_socket: socket.socket,
    proxy_client_socket: socket.socket,
    cache_file: Path,
    bufsize: int,
) -> None:
    cache_file.parent.mkdir(parents=True, exist_ok=True)
    first_header, _, first_body = first_response.partition(b"\r\n\r\n")

    encoding = b""
    encoding_id = first_header.lower().find(b"content-encoding:")
    if encoding_id > 0:
        encoding_line, _, _ = first_header[encoding_id:].partition(b"\r\n")
        _, encoding, *_ = encoding_line.split(maxsplit=2)
        encoding = encoding.lower()
    convert = converters[encoding]

    first_body = convert(first_body)
    with cache_file.open("wb") as f:
        connection_socket.send(first_body)
        f.write(first_body)
        # TODO: Stop receiving data appropriately
        while response := convert(proxy_client_socket.recv(bufsize)):
            connection_socket.send(response)
            f.write(response)


def main(server_ip: str = "", bufsize: int = 1024) -> None:
    cache_dir = Path(".cache")

    with socket.create_server((server_ip, 80)) as proxy_server_socket:
        while True:
            print("Ready to serve...")
            connection_socket, addr = proxy_server_socket.accept()
            print("Received a connection from:", addr)
            with connection_socket:
                request = connection_socket.recv(bufsize).decode()
                print(request)

                method, target, _ = request.split(maxsplit=2)

                # TODO: Pass the request to the server if it is not a GET request
                if method.lower() != "get":
                    continue

                _, _, host_n_file = target.partition("://")
                server_host, _, filename = host_n_file.partition("/")
                if filename == "":
                    # TODO: Cache the file with appropriate name
                    continue

                cache_file = cache_dir / host_n_file

                try:
                    file = cache_file.open("rb")
                except FileNotFoundError:
                    with socket.create_connection(
                        (server_host, 80)
                    ) as proxy_client_socket:
                        proxy_client_socket.send(request.encode())
                        response = proxy_client_socket.recv(bufsize)
                        send_and_save(
                            response,
                            connection_socket,
                            proxy_client_socket,
                            cache_file,
                            bufsize,
                        )
                else:
                    now = datetime.now(UTC).strftime("%a, %d %b %Y %H:%M:%S GMT")
                    request = f"{request.rstrip()}\r\nIf-Modified-Since: {now}\r\n\r\n"

                    with socket.create_connection(
                        (server_host, 80)
                    ) as proxy_client_socket:
                        proxy_client_socket.send(request.encode())
                        response = proxy_client_socket.recv(bufsize)
                        _, status_code, _ = response.split(maxsplit=2)
                        if status_code == b"304":
                            connection_socket.send("HTTP/1.0 200 OK\r\n\r\n".encode())
                            for line in file:
                                line_crlf = line.rstrip(b"\n") + b"\r\n"
                                connection_socket.send(line_crlf)
                            file.close()
                            connection_socket.send("\r\n".encode())
                        else:
                            send_and_save(
                                response,
                                connection_socket,
                                proxy_client_socket,
                                cache_file,
                                bufsize,
                            )


if __name__ == "__main__":
    typer.run(main)
