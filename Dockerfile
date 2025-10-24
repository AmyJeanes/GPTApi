FROM python:3.13@sha256:20acba1d5a0baf779921a10a8118dfecb4fb50d5b60187e28709884c7ad839ad

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]