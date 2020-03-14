FROM python:3.7.4-alpine3.10

COPY requirements.txt .
COPY ./app/main.py ./
COPY static ./static
COPY templates ./templates
COPY config ./config

ENV UWSGI_CHEAPER 50
ENV UWSGI_PROCESSES 51

RUN apk add python3-dev build-base linux-headers pcre-dev
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["uwsgi", "--http", ":5000", "--manage-script-name", "--mount", "/=main:app"]