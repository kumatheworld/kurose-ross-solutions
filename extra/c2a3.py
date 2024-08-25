import base64
import socket
import ssl
from os import environ
from pathlib import Path


class SMTPError(Exception):
    pass


def b64trans(message: str) -> str:
    return base64.b64encode(message.encode()).decode()


def main(bufsize: int = 1024) -> None:
    mailserver = "smtp.gmail.com"

    # Your Gmail credentials
    username = environ["GMAIL_ADDRESS"]
    password = environ["GMAIL_PASSWORD"]

    # Email details
    subject = "Subject: Do you love computer networks?"
    body = "I love computer networks!"
    attachment = Path("extra/c2p22.png")

    # Read and encode the attachment
    with attachment.open("rb") as f:
        encoded_file = base64.b64encode(f.read()).decode()

    boundary = (
        "----=_Part_0_123456789.123456789"  # Custom boundary for separating parts
    )

    # Construct the MIME message
    message = "\r\n".join(
        [
            f"From: {username}",
            f"To: {username}",
            f"Subject: {subject}",
            "MIME-Version: 1.0",
            f'Content-Type: multipart/mixed; boundary="{boundary}"',
            "",
            f"--{boundary}",
            'Content-Type: text/plain; charset="UTF-8"',
            "Content-Transfer-Encoding: 7bit",
            "",
            body,
            "",
            f"--{boundary}",
            f'Content-Type: application/octet-stream; name="{f.name}"',
            f'Content-Disposition: attachment; filename="{f.name}"',
            "Content-Transfer-Encoding: base64",
            "",
            encoded_file,
            "",
            f"--{boundary}--",
            ".",
        ]
    )

    with socket.create_connection((mailserver, 587)) as client_socket:

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

        # Send EHLO command and print server response.
        send_and_receive("EHLO Alice")

        # Request to start TLS and secure the connection.
        send_and_receive("STARTTLS", 220)

        # Wrap the socket with SSL/TLS.
        context = ssl.create_default_context()
        with context.wrap_socket(
            client_socket, server_hostname=mailserver
        ) as client_socket:
            # Send EHLO again after securing the connection.
            send_and_receive("EHLO Alice")

            # Authenticate using base64 encoded username and password
            send_and_receive("AUTH LOGIN", 334)
            send_and_receive(b64trans(username), 334)
            send_and_receive(b64trans(password), 235)

            # Send MAIL FROM command and print server response.
            send_and_receive(f"MAIL FROM: <{username}>")

            # Send RCPT TO command and print server response.
            send_and_receive(f"RCPT TO: <{username}>")

            # Send DATA command and print server response.
            send_and_receive("DATA", 354)

            # Send the MIME email message.
            send_and_receive(message)

            # Send QUIT command and get server response.
            send_and_receive("QUIT", 221)


if __name__ == "__main__":
    main()
