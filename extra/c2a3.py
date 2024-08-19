import socket


class SMTPError(Exception):
    pass


def main(bufsize: int = 1024) -> None:
    # Choose a mail server (e.g. Google mail server) and call it mailserver
    mailserver = "smtp.gmail.com"

    # Create socket called client_socket and establish a TCP connection with mailserver
    with socket.create_connection((mailserver, 25)) as client_socket:

        def receive_message(code: int = 250) -> None:
            response = client_socket.recv(bufsize).decode()
            print(f"S: {response.rstrip()}")
            if response[:3] != str(code):
                raise SMTPError(f"Expected code {code} but got {response[:3]}.")

        def send_and_receive(message: str, code: int = 250) -> None:
            client_socket.send(f"{message}\r\n".encode())
            print(f"C: {message}")
            receive_message(code)

        print(f"Connected to {mailserver}")
        receive_message(220)

        # Send HELO command and print server response.
        send_and_receive("HELO Alice")

        # Send MAIL FROM command and print server response.
        send_and_receive("MAIL FROM: <kum@theworld.com>")

        # Send RCPT TO command and print server response.
        send_and_receive("RCPT TO: <kum4th3w0rld@gmail.com>")

        # Send DATA command and print server response.
        send_and_receive("DATA", 354)

        # Send message data.
        # Message ends with a single period.
        send_and_receive("I love computer networks!\r\n.")

        # Send QUIT command and get server response.
        send_and_receive("QUIT", 221)


if __name__ == "__main__":
    main()
