import socket
import ssl


class SMTPError(Exception):
    pass


def main(bufsize: int = 1024) -> None:
    # Choose a mail server (e.g. Google mail server) and call it mailserver
    mailserver = "smtp.gmail.com"
    port = 465  # TLS/SSL port for SMTP

    # Create SSL context
    context = ssl.create_default_context()

    # Create socket and wrap it with SSL
    with socket.create_connection(
        (mailserver, port)
    ) as client_socket, context.wrap_socket(
        client_socket, server_hostname=mailserver
    ) as secure_socket:

        def receive_message(code: int = 250) -> None:
            response = secure_socket.recv(bufsize).decode()
            print(f"S: {response.rstrip()}")
            if response[:3] != str(code):
                raise SMTPError(f"Expected code {code} but got {response[:3]}.")

        def send_and_receive(message: str, code: int = 250) -> None:
            secure_socket.send(f"{message}\r\n".encode())
            print(f"C: {message}")
            receive_message(code)

        print(f"Connected to {mailserver} over TLS")
        receive_message(220)

        # Send EHLO command (instead of HELO) and print server response.
        # EHLO is more modern and used with TLS connections.
        send_and_receive("EHLO Alice")

        # Send MAIL FROM command and print server response.
        send_and_receive("MAIL FROM: <kum4th@theworld.com>")

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
