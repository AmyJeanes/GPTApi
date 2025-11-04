FROM python:3.14@sha256:7960a76b45493e8a3b87a0365e257c547b66e8d0c8cd629c029aec9c9e31ed5e

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]