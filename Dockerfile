FROM python:3.14@sha256:b370b01487e7e82d0ef36bad3da30fc66f3466444b9157f28bb4fec6b5023d4b

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]