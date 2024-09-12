import socket
from concurrent.futures import ThreadPoolExecutor


def send_data(connection_socket: socket.socket, bufsize: int) -> None:
    with connection_socket:
        message = connection_socket.recv(bufsize).decode()
        filename = message.split()[1]
        try:
            file = open(filename[1:], "rb")
        except FileNotFoundError:
            # Send response message for file not found
            connection_socket.send(b"404 Not Found\r\n")
        else:
            # Send one HTTP header line into socket
            connection_socket.send(b"HTTP/1.0 200 OK\r\n\r\n")
            # Send the content of the requested file to the client
            for line in file:
                line_crlf = line.rstrip(b"\n") + b"\r\n"
                connection_socket.send(line_crlf)
            file.close()
        finally:
            connection_socket.send(b"\r\n")


def main(server_port: int = 80, bufsize: int = 1024) -> None:
    with socket.create_server(
        ("", server_port)
    ) as server_socket, ThreadPoolExecutor() as executor:
        while True:
            # Establish the connection
            print("Ready to serve...")
            connection_socket, _ = server_socket.accept()
            executor.submit(send_data, connection_socket, bufsize)


if __name__ == "__main__":
    main()
