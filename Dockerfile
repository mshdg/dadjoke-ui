FROM python:3.9.0a5-alpine3.10

ENV DATA_URL=''

COPY requirements.txt .
COPY ./app ./
COPY static ./static
COPY templates ./templates
COPY uwsgi.ini ./

RUN apk add python3-dev build-base linux-headers pcre-dev curl
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

CMD ["uwsgi", "--ini", "uwsgi.ini"]
