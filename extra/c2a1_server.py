import socket


def main(server_port: int = 80, bufsize: int = 1024) -> None:
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server_socket:
        server_socket.bind(("", server_port))
        server_socket.listen()
        while True:
            # Establish the connection
            print("Ready to serve...")
            connection_socket, _ = server_socket.accept()
            with connection_socket:
                message = connection_socket.recv(bufsize).decode()
                filename = message.split()[1]
                try:
                    file = open(filename[1:])
                except FileNotFoundError:
                    # Send response message for file not found
                    connection_socket.send("404 Not Found\r\n".encode())
                else:
                    # Send one HTTP header line into socket
                    connection_socket.send("HTTP/1.0 200 OK\r\n\r\n".encode())
                    # Send the content of the requested file to the client
                    for line in file:
                        line_crlf = line.rstrip("\n") + "\r\n"
                        connection_socket.send(line_crlf.encode())
                    file.close()
                finally:
                    connection_socket.send("\r\n".encode())


if __name__ == "__main__":
    main()
