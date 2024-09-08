import socket
from datetime import UTC, datetime
from pathlib import Path

import typer


def send_and_save(
    first_response: bytes,
    connection_socket: socket.socket,
    proxy_client_socket: socket.socket,
    cache_file: Path,
    bufsize: int,
) -> None:
    cache_file.parent.mkdir(parents=True, exist_ok=True)
    _, _, first_body = first_response.partition(b"\r\n\r\n")
    # TODO: Take encoding into account
    with cache_file.open("wb") as f:
        connection_socket.send(first_body)
        f.write(first_body)
        # TODO: Stop receiving data appropriately
        while response := proxy_client_socket.recv(bufsize):
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
                cache_file = cache_dir / host_n_file

                server_host, _, _ = host_n_file.partition("/")

                try:
                    file = cache_file.open()
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
                        _, status_code, _ = response.split(b"\r\n", maxsplit=2)
                        if status_code == "304":
                            proxy_server_socket.send("HTTP/1.0 200 OK\r\n\r\n".encode())
                            for line in file:
                                line_crlf = line.rstrip("\n") + "\r\n"
                                proxy_server_socket.send(line_crlf.encode())
                            file.close()
                            proxy_server_socket.send("\r\n".encode())
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
