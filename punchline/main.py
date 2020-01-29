#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import requests
import json

url = "http://zko.hopto.org:55058/"


def get_data(url):
    r = requests.get(url)
    json_data = json.loads(r.text)
    return json_data


def joke_builder():
    json_data = get_data(url)
    joke = (json_data["Joke"])
    joke_opener = (joke["Opener"])
    joke_punchline = (joke["Punchline"])
    return joke_opener, joke_punchline


def main():
    joke_opener, joke_punchline = joke_builder()
    print(joke_opener)
    print(joke_punchline)


if __name__ == '__main__':
    main()
