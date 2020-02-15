FROM python:3.7.4-alpine3.10

COPY requirements.txt .

RUN apk update && apk add python3-dev build-base linux-headers pcre-dev
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY ./app/main.py ./
COPY static ./static
COPY templates ./templates

CMD ["python", "-u", "main.py"]