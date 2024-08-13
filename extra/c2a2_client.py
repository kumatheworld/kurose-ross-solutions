import socket
from datetime import datetime
from itertools import count
from random import randrange
from statistics import mean, stdev
from time import perf_counter, sleep


def main(
    server_host: str = "localhost", server_port: int = 12000, bufsize: int = 1024
) -> None:
    with socket.socket(type=socket.SOCK_DGRAM) as client_socket:
        for i in range(1, 11):
            client_socket.settimeout(1)
            message = f"Ping {i} {datetime.now()}".encode()
            start = perf_counter()
            try:
                client_socket.sendto(message, (server_host, server_port))
                response = client_socket.recv(bufsize)
            except socket.timeout:
                print("Request timed out")
            else:
                end = perf_counter()
                rtt = (end - start) * 1e3
                print(f"Server response: {response.decode()}")
                print(f"RTT = {rtt:.3f} ms")


def opt1(
    server_host: str = "localhost",
    server_port: int = 12000,
    bufsize: int = 1024,
) -> None:
    print(f"UDP PING {server_host}")
    rtts: list[float] = []
    num_lost = 0
    with socket.socket(type=socket.SOCK_DGRAM) as client_socket:
        try:
            for i in count():
                client_socket.settimeout(1)
                message = f"Ping {i} {datetime.now()}".encode()
                start = perf_counter()
                try:
                    client_socket.sendto(message, (server_host, server_port))
                    response, (server_host_ret, server_port_ret) = (
                        client_socket.recvfrom(bufsize)
                    )
                except socket.timeout:
                    print(f"Request timeout for udp_ping_seq {i}")
                    num_lost += 1
                else:
                    end = perf_counter()
                    rtt = (end - start) * 1e3
                    print(
                        f"{len(response)} bytes from {server_host_ret}:{server_port_ret}: udp_ping_seq={i} ttl=n/a time={rtt:.3f} ms"
                    )
                    rtts.append(rtt)
                finally:
                    sleep(1)
        except KeyboardInterrupt:
            i += 1
            print(
                "\n"
                f"--- {server_host}:{server_port} udp_ping statistics ---\n"
                f"{i} packets transmitted, {i - num_lost} packets received, {100 * num_lost / i:.1f}% packet loss\n"
                f"round-trip min/avg/max/stddev = {min(rtts):.3f}/{mean(rtts):.3f}/{max(rtts):.3f}/{stdev(rtts):.3f} ms"
            )


def opt2(
    server_host: str = "localhost", server_port: int = 12000, wait_max: int = 5
) -> None:
    with socket.socket(type=socket.SOCK_DGRAM) as client_socket:
        for i in count():
            client_socket.settimeout(1)
            now = datetime.now()
            message = f"{i} {now}".encode()
            client_socket.sendto(message, (server_host, server_port))
            print(f"{now} message sent to {server_host}:{server_port}")
            sleep(randrange(wait_max))


if __name__ == "__main__":
    main()
