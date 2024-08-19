import socket

import typer


def main(
    server_host: str, server_port: int, filename: str, bufsize: int = 1024
) -> None:
    with socket.create_connection((server_host, server_port)) as client_socket:
        request = f"GET /{filename} HTTP/1.0\r\n\r\n"
        client_socket.send(request.encode())
        while response := client_socket.recv(bufsize).decode():
            print(response, end="")


if __name__ == "__main__":
    typer.run(main)
