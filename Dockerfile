FROM python:3.13@sha256:9c5a9be272fbd980f0719e65addfe63f65a4d3b1afa33584d75f6c845b7119b1

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]