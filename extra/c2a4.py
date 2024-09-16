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
    # TODO: What if header is longer than the first response?
    header, _, first_body = first_response.partition(b"\r\n\r\n")

    encoding = b""
    remaining = 0
    for line in header.lower().split(b"\r\n"):
        key, _, value = line.partition(b":")
        match key:
            case b"content-encoding":
                encoding = value.strip()
            # TODO: What if Content-Length is missing?
            case b"content-length":
                remaining = int(value.strip())

    chunk_org = first_body
    convert = converters[encoding]
    with cache_file.open("wb") as f:
        while True:
            remaining -= len(chunk_org)
            chunk = convert(chunk_org)
            connection_socket.send(chunk)
            f.write(chunk)
            if not remaining:
                break
            chunk_org = proxy_client_socket.recv(bufsize)


def main(server_ip: str = "", bufsize: int = 1024) -> None:
    cache_dir = Path(".cache")

    with socket.create_server((server_ip, 80)) as proxy_server_socket:
        while True:
            print("Ready to serve...")
            connection_socket, addr = proxy_server_socket.accept()
            print("Received a connection from:", addr)
            with connection_socket:
                request = connection_socket.recv(bufsize)
                print(request)

                method, target, _ = request.split(maxsplit=2)

                # TODO: Pass the request to the server if it is not a GET request
                if method.lower() != b"get":
                    continue

                _, _, host_n_file = target.partition(b"://")
                server_host, _, filename = host_n_file.partition(b"/")
                if filename == "":
                    # TODO: Cache the file with appropriate name
                    continue

                cache_file = cache_dir / host_n_file.decode()

                try:
                    file = cache_file.open("rb")
                except FileNotFoundError:
                    with socket.create_connection(
                        (server_host.decode(), 80)
                    ) as proxy_client_socket:
                        proxy_client_socket.send(request)
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
                    request = b"%b\r\nIf-Modified-Since: %b\r\n\r\n" % (
                        request.rstrip(),
                        str(now).encode(),
                    )
                    with socket.create_connection(
                        (server_host.decode(), 80)
                    ) as proxy_client_socket:
                        proxy_client_socket.send(request)
                        response = proxy_client_socket.recv(bufsize)
                        _, status_code, _ = response.split(maxsplit=2)
                        if status_code == b"304":
                            connection_socket.send(b"HTTP/1.0 200 OK\r\n\r\n")
                            for line in file:
                                line_crlf = line.rstrip(b"\n") + b"\r\n"
                                connection_socket.send(line_crlf)
                            file.close()
                            connection_socket.send(b"\r\n")
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
