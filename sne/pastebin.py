import requests


def pastebin(text):
    api_key = "d2004f9b24624585334cc3950ab6a7e0"
    url = "https://pastebin.com/api/api_post.php"
    payload = {
        "api_dev_key": api_key,
        "api_paste_code": text,
        "api_paste_private": 0,
        "api_option": "paste"
    }
    res = requests.post(url, data=payload)
    return (res.text)
