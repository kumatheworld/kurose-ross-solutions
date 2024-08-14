import socket
from datetime import datetime
from itertools import count
from random import randrange


def parse_message(message: bytes) -> tuple[int, datetime]:
    seq_num_str, now_str = message.decode().split(" ", 1)
    return int(seq_num_str), datetime.strptime(now_str, "%Y-%m-%d %H:%M:%S.%f")


def opt2(server_port: int = 12000, wait_time: float = 3, bufsize: int = 1024) -> None:
    with socket.socket(type=socket.SOCK_DGRAM) as server_socket:
        server_socket.bind(("", server_port))
        message = server_socket.recv(bufsize)
        _, then = parse_message(message)
        for i in count(1):
            server_socket.settimeout(wait_time)
            try:
                message = server_socket.recv(bufsize)
            except socket.timeout:
                print(f"Heartbeat not heard for {wait_time} seconds")
                message = server_socket.recv(bufsize)
            finally:
                _, now = parse_message(message)
                print(f"Packet {i} received. Time difference: {now - then}")
                then = now


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
