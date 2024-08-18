import socket


def main(bufsize: int = 1024) -> None:
    msg = "\r\n I love computer networks!"
    endmsg = "\r\n.\r\n"

    # Choose a mail server (e.g. Google mail server) and call it mailserver
    mailserver = ...  # Fill in start #Fill in end

    # Create socket called client_socket and establish a TCP connection with mailserver
    with socket.socket() as client_socket:
        client_socket.connect((mailserver, 25))
        recv = client_socket.recv(bufsize).decode()
        print(recv)
        if recv[:3] != "220":
            print("220 reply not received from server.")

        # Send HELO command and print server response.
        helo_command = "HELO Alice\r\n"
        client_socket.send(helo_command.encode())
        recv1 = client_socket.recv(bufsize).decode()
        print(recv1)
        if recv1[:3] != "250":
            print("250 reply not received from server.")

        # Send MAIL FROM command and print server response.
        # Fill in start
        # Fill in end
        # Send RCPT TO command and print server response.
        # Fill in start
        # Fill in end
        # Send DATA command and print server response.
        # Fill in start
        # Fill in end
        # Send message data.
        # Fill in start
        # Fill in end
        # Message ends with a single period.
        # Fill in start
        # Fill in end
        # Send QUIT command and get server response.
        # Fill in start
        # Fill in end


if __name__ == "__main__":
    main()
