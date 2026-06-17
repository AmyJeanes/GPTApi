FROM python:3.14@sha256:4d7dd74c5b2d3151fe58eb8ecc9c56be13471a240ce5423ba765b04f8f95ebe8

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]