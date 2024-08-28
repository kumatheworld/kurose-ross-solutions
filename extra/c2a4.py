import socket

import typer


def main(server_ip: str = "", bufsize: int = 1024) -> None:
    # Create a server socket, bind it to a port and start listening
    with socket.create_server((server_ip, 80)) as tcp_ser_sock:
        while True:
            # Strat receiving data from the client
            print("Ready to serve...")
            tcp_cli_sock, addr = tcp_ser_sock.accept()
            print("Received a connection from:", addr)
            with tcp_cli_sock:
                message = tcp_cli_sock.recv(bufsize).decode()
                print(message)
                fileuri = message.split()[1]
                _, _, filename = fileuri.partition("://")
                print(f"{filename=}")
                try:
                    # Check wether the file exist in the cache
                    f = open(filename)
                # Error handling for file not found in cache
                except IOError:
                    # Create a socket on the proxyserver
                    c = ...  # Fill in start. # Fill in end.
                    hostn = filename.replace("www.", "", 1)
                    print(hostn)
                    # Connect to the socket to port 80
                    # Fill in start.
                    # Fill in end.
                    # Create a temporary file on this socket and ask port 80 for the file requested by the client
                    fileobj = c.makefile("r", 0)
                    fileobj.write(f"GET http://{filename} HTTP/1.0\n\n")
                    # Read the response into buffer
                    # Fill in start.
                    # Fill in end.
                    # Create a new file in the cache for the requested file.
                    # Also send the response in the buffer to client socket and the corresponding file in the cache
                    tmpFile = open("./" + filename, "wb")
                    # Fill in start.
                    # Fill in end.
                    # HTTP response message for file not found if file is not found.
                    # Fill in start.
                    # Fill in end.
                else:
                    outputdata = f.readlines()
                    f.close()
                    # ProxyServer finds a cache hit and generates a response message
                    tcp_cli_sock.send("HTTP/1.0 200 OK\r\n")
                    tcp_cli_sock.send("Content-Type:text/html\r\n")
                    # Fill in start.
                    # Fill in end.
                    print("Read from cache")
            # Fill in start.
            # Fill in end.


if __name__ == "__main__":
    typer.run(main)
