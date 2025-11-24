FROM python:3.14@sha256:edf6433343f65f94707985869aeaafe8beadaeaee11c4bc02068fca52dce28dd

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]