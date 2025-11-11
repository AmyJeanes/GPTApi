FROM python:3.14@sha256:e6b1f7011589cc717a5112e6fdb56217e9e734a57e4cb50216e912b068b392a8

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]