import socket
from datetime import UTC, datetime
from pathlib import Path

import typer


def main(server_ip: str = "", bufsize: int = 1024) -> None:
    cache_dir = Path(".cache")
    # Create a server socket, bind it to a port and start listening
    with socket.create_server((server_ip, 80)) as proxy_server_socket:
        while True:
            # Strat receiving data from the client
            print("Ready to serve...")
            client_socket, addr = proxy_server_socket.accept()
            print("Received a connection from:", addr)
            with client_socket:
                request = client_socket.recv(bufsize).decode()
                print(request)

                method, target, _ = request.split(maxsplit=2)

                # TODO: Pass the request to the server if it is not a GET request
                if method.lower() != "get":
                    continue

                _, _, host_n_file = target.partition("://")
                cache_file = cache_dir / host_n_file

                server_host, _, filepath = host_n_file.partition("/")

                try:
                    file = cache_file.open()
                except FileNotFoundError:
                    # TODO: Pass the request to the server, pass the response to the client and cache the file
                    pass
                else:
                    now = datetime.now(UTC).strftime("%a, %d %b %Y %H:%M:%S GMT")
                    request = f"{request.rstrip()}\r\nIf-Modified-Since: {now}\r\n\r\n"

                    with socket.create_connection(
                        (server_host, 80)
                    ) as proxy_client_socket:
                        response = proxy_client_socket.recv(bufsize).decode()
                        _, status_code, _ = response.split(maxsplit=2)
                        if status_code == "304":
                            proxy_server_socket.send("HTTP/1.0 200 OK\r\n\r\n".encode())
                            for line in file:
                                line_crlf = line.rstrip("\n") + "\r\n"
                                proxy_server_socket.send(line_crlf.encode())
                            file.close()
                            proxy_server_socket.send("\r\n".encode())
                        else:
                            # TODO: If the file is modified, pass the response to the client and cache the file
                            pass


if __name__ == "__main__":
    typer.run(main)
