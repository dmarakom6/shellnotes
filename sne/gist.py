import os
import sys
import json
import datetime
import requests

def create_gist_with_requests(headers, body):
    response = requests.post('https://api.github.com/gists', json=body, headers=headers)
    if response.ok:
        response_data = response.json()
        return response_data["html_url"]
    else:
        raise RuntimeError(f"Github API error: {response.status_code}")

def create_gist(text, token):
    today = datetime.date.today()
    headers = {
        'Authorization': f'Bearer {token}',
        'User-agent': 'python-gist',
        'Accept': 'application/json',
        'X-GitHub-Api-Version': '2022-11-28'
    }
    body = {
        "description": f"Uploaded on {today} via SnE",
        "files": {f"{today}.txt": {"content": text}},
        "public": False
    }

    return create_gist_with_requests(headers, body)
