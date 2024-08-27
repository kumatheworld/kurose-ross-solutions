import socket

import typer


def main(server_ip: str, bufsize: int = 1024) -> None:
    # Create a server socket, bind it to a port and start listening
    with socket.create_server((server_ip, 80)) as tcp_ser_sock:
        while True:
            # connection_socket, _ = server_socket.accept()
            # with connection_socket:
            #     message = connection_socket.recv(bufsize).decode()
            #     print(message)

            # Strat receiving data from the client
            print("Ready to serve...")
            tcp_cli_sock, addr = tcp_ser_sock.accept()
            print("Received a connection from:", addr)
            with tcp_cli_sock:
                message = tcp_cli_sock.recv(bufsize).decode()
                print(message)
                # Extract the filename from the given message
                print(message.split()[1])
                filename = message.split()[1].partition("/")[2]
                print(filename)
                fileExist = "false"
                filetouse = "/" + filename
                print(filetouse)
                try:
                    # Check wether the file exist in the cache
                    with open(filetouse[1:]) as f:
                        outputdata = f.readlines()
                    fileExist = "true"
                    # ProxyServer finds a cache hit and generates a response message
                    tcp_cli_sock.send("HTTP/1.0 200 OK\r\n")
                    tcp_cli_sock.send("Content-Type:text/html\r\n")
                    # Fill in start.
                    # Fill in end.
                    print("Read from cache")
                # Error handling for file not found in cache
                except IOError:
                    if fileExist == "false":
                        # Create a socket on the proxyserver
                        c = ...  # Fill in start. # Fill in end.
                        hostn = filename.replace("www.", "", 1)
                        print(hostn)
                        try:
                            # Connect to the socket to port 80
                            # Fill in start.
                            # Fill in end.
                            # Create a temporary file on this socket and ask port 80 for the file requested by the client
                            fileobj = c.makefile("r", 0)
                            fileobj.write(
                                "GET " + "http://" + filename + "HTTP/1.0\n\n"
                            )
                            # Read the response into buffer
                            # Fill in start.
                            # Fill in end.
                            # Create a new file in the cache for the requested file.
                            # Also send the response in the buffer to client socket and the corresponding file in the cache
                            tmpFile = open("./" + filename, "wb")
                            # Fill in start.
                            # Fill in end.
                        except:
                            print("Illegal request")
                    else:
                        pass
                        # HTTP response message for file not found
                        # Fill in start.
                        # Fill in end.
            # Fill in start.
            # Fill in end.


if __name__ == "__main__":
    typer.run(main)
