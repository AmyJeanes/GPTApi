FROM python:3.14@sha256:455fc8bf2552c51738d27fde570c22bb0146d22f2e16e32a9baff8d2da94daf6

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]