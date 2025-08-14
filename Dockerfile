FROM python:3.13@sha256:1e4584c017d9cecf8a952cfd8f8e47ef5611b28dfc29da9e1d4b6bad98daf9b0

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]