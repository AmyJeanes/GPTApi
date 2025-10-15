FROM python:3.13@sha256:b7341c0bd097a5f8763418c20553c539eb917d22cb87e9706fc2da0d4b702199

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]