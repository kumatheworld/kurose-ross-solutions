import socket

import typer


def main(server_ip: str = "", bufsize: int = 1024) -> None:
    # Create a server socket, bind it to a port and start listening
    with socket.create_server((server_ip, 80)) as proxy_server_socket:
        while True:
            # Strat receiving data from the client
            print("Ready to serve...")
            client_socket, addr = proxy_server_socket.accept()
            print("Received a connection from:", addr)
            with client_socket:
                client_request = client_socket.recv(bufsize).decode()
                print(client_request)
                fileuri = client_request.split()[1]
                _, _, host_n_file = fileuri.partition("://")
                print(f"{host_n_file=}")
                try:
                    # Check wether the file exist in the cache
                    f = open(host_n_file)
                # Error handling for file not found in cache
                except IOError:
                    # Create a socket on the proxyserver and connect to the server port 80
                    server_host, _, filename = host_n_file.partition("/")
                    with socket.create_connection(
                        (server_host, 80)
                    ) as proxy_client_socket:
                        # Request the file
                        request = f"GET /{filename} HTTP/1.0\r\n\r\n"
                        proxy_client_socket.send(request.encode())
                        # If the file exists, cache it and send it to the client.
                        # If it doesn't, return an error message.
                        # The following is not correct and should be fixed.
                        while server_response := proxy_client_socket.recv(
                            bufsize
                        ).decode():
                            print(server_response, end="")
                else:
                    print("Read from cache")
                    outputdata = f.readlines()
                    f.close()
                    # Send the file to the client
                    # Fill in start.
                    # Fill in end.


if __name__ == "__main__":
    typer.run(main)
