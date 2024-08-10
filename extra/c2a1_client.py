import socket

import typer


def main(
    server_host: str, server_port: int, filename: str, bufsize: int = 1024
) -> None:
    with socket.socket() as client_socket:
        client_socket.connect((server_host, server_port))
        request = f"GET /{filename} HTTP/1.0\r\n\r\n"
        client_socket.send(request.encode())
        while response := client_socket.recv(bufsize).decode():
            print(response, end="")


if __name__ == "__main__":
    typer.run(main)
