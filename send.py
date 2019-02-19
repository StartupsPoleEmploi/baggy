#! /usr/bin/env python3
import argparse
import requests

def main():
    parser = argparse.ArgumentParser(description="Send a test message using the Postal HTTP API")
    parser.add_argument(
        "-t", "--to",
        nargs="+", required=True,
        help="Email recipient. This option can be repeated multiple times"
    )
    parser.add_argument(
        "-f", "--from",
        dest="sender", required=True,
        help="Email sender"
    )
    parser.add_argument(
        "-s", "--subject",
        default="Hello world",
        help="Email subject"
    )
    parser.add_argument(
        "-b", "--body",
        default="",
        help="Email body"
    )
    parser.add_argument(
        "-k", "--key",
        required=True,
        help="API key"
    )
    parser.add_argument(
        "-H", "--host",
        default="http://localhost",
        help="Postal host"
    )
    parser.add_argument(
        "-p", "--port",
        type=int, default=80,
        help="Postal port"
    )
    args = parser.parse_args()
    response = requests.post(
        "{}:{}/api/v1/send/message".format(args.host, args.port),
        json={
            "to": args.to,
            "from": args.sender,
            "subject": args.subject,
            "plain_body": args.body,
        },
        headers={
            "X-Server-API-Key": args.key,
        }
    )
    print("Response code:", response.status_code)
    print("Response body:", response.content.decode())

if __name__ == "__main__":
    main()
