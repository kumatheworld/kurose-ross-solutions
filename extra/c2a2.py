import socket
from datetime import datetime
from time import perf_counter


def main(
    server_host: str = "localhost", server_port: int = 12000, bufsize: int = 1024
) -> None:
    with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as client_socket:
        for i in range(1, 11):
            client_socket.settimeout(1)
            message = f"Ping {i} {datetime.now()}"
            start = perf_counter()
            try:
                client_socket.sendto(message.encode(), (server_host, server_port))
                response = client_socket.recv(bufsize).decode()
            except socket.timeout:
                print("Request timed out")
            else:
                end = perf_counter()
                print(f"Server response: {response}")
                print(f"RTT = {(end - start) * 1e6:,.0f} µs")


if __name__ == "__main__":
    main()
