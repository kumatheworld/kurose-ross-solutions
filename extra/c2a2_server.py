import socket
from random import randrange


def main(server_port: int = 12000, bufsize: int = 1024) -> None:
    with socket.socket(type=socket.SOCK_DGRAM) as server_socket:
        server_socket.bind(("", server_port))
        while True:
            message, address = server_socket.recvfrom(bufsize)
            message = message.upper()
            if randrange(10) < 7:
                server_socket.sendto(message, address)


if __name__ == "__main__":
    main()
