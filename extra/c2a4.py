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
                _, _, host_n_file = fileuri.partition("://")
                print(f"{host_n_file=}")
                try:
                    # Check wether the file exist in the cache
                    f = open(host_n_file)
                # Error handling for file not found in cache
                except IOError:
                    # Create a socket on the proxyserver and connect to the server port 80
                    server_host, _, filename = host_n_file.partition("/")
                    with socket.create_connection((server_host, 80)) as client_socket:
                        # Request the file
                        request = f"GET /{filename} HTTP/1.0\r\n\r\n"
                        client_socket.send(request.encode())
                        # If the file exists, cache it and send it to the client.
                        # If it doesn't, return an error message.
                        # The following is not correct and should be fixed.
                        while response := client_socket.recv(bufsize).decode():
                            print(response, end="")
                else:
                    print("Read from cache")
                    outputdata = f.readlines()
                    f.close()
                    # Send the file to the client
                    # Fill in start.
                    # Fill in end.


if __name__ == "__main__":
    typer.run(main)
