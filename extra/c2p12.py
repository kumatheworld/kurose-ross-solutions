import socket


def main(server_port: int = 9090, bufsize: int = 1024) -> None:
    with socket.socket() as server_socket:
        server_socket.bind(("", server_port))
        server_socket.listen()
        while True:
            connection_socket, _ = server_socket.accept()
            with connection_socket:
                message = connection_socket.recv(bufsize).decode()
                print(message)


if __name__ == "__main__":
    main()
