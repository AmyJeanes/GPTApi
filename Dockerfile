FROM python:3.14@sha256:297cf11d0b98b38ac26a56136f0279df845314bcd0347c1f6383fee6e75125ee

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]