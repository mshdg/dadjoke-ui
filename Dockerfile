FROM python:3.7.4-alpine3.10

COPY requirements.txt .
COPY ./app/main.py ./
COPY static ./static
COPY templates ./templates
COPY config ./config
COPY uwsgi.ini ./

RUN apk add python3-dev build-base linux-headers pcre-dev
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["uwsgi", "--ini", "uwsgi.ini"]