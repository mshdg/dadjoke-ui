#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import requests
import json
import os
from flask import Flask, send_from_directory, render_template

url = "http://dad-jokes.application.svc.cluster.local/"


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


app = Flask(__name__)
@app.route("/")
def joke():
    joke_opener, joke_punchline = joke_builder()
    return render_template('index.html', joke=joke_opener, punchline=joke_punchline)


@app.route('/favicon.ico')
def favicon():
    return send_from_directory(os.path.join(app.root_path, 'static'),
                               'favicon.ico', mimetype='image/vnd.microsoft.icon')


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
