#! /usr/bin/env python3
import requests

def main():
    response = requests.post(
        "http://localhost/api/v1/send/message",
        json={
            "to": ["regis@behmo.com"],
            "from": "pouac@jepostule.labonneboite.pole-emploi.fr",
            "subject": "Bonjour monde !",
            "plain_body": "怎么样？",
        },
        headers={
            "X-Server-API-Key": "RqnjlOCr4ZNVzjar92bwLg2t",
        }
    )
    print(response.status_code)
    print(response.content)

if __name__ == "__main__":
    main()
