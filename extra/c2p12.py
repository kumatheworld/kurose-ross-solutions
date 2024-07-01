import socket


def main(server_port: int = 9090, bufsize: int = 1024) -> None:
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind(("", server_port))
    server_socket.listen()
    while True:
        connection_socket, _ = server_socket.accept()
        message = connection_socket.recv(bufsize).decode()
        print(message)
        connection_socket.close()


if __name__ == "__main__":
    main()
