FROM python:3.13@sha256:0c745292b7b34dcdd6050527907d78c39363dc45ad6afc6d107c454b93cebca1

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]