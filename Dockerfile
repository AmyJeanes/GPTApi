FROM python:3.14@sha256:4bc0b65c0a438abef1383fbce459ae997a9689b781eb2c2ee31faf4c94585ba1

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]