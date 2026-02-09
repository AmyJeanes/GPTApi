FROM python:3.14@sha256:4b827abf32c14b7df9a0dc5199c2f0bc46e2c9862cd5d77eddae8a2cd8460f60

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]