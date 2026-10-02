FROM python:3.14@sha256:1ae5b32b33f502335ed9f5ee7afa4387192e9566b1328fc66da836c77c1cfb65

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]