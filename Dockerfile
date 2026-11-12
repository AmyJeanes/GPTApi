FROM python:3.14@sha256:a7097ae62ea4cf4fec036282cbf97f0d0b7b4f9cb286277951115fb30442527d

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]