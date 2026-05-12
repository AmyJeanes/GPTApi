FROM python:3.14@sha256:2ca6cda25055227533141435ab8ec0dd3afd9165d78d8bf0f58c8d959d57b9fc

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]