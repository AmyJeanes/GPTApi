FROM python:3.14@sha256:46a17be7cf526995fbf12177b40c248de30b40c1a509a4c7e5da954226f6885b

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]