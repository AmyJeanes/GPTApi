FROM python:3.14@sha256:0ba001803c72c128063cfa88863755f905cefabe73c026c66a5a86d8f1d63e98

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]