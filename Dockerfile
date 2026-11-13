FROM python:3.15@sha256:df3f05ff4d74833f52146edd195c8f7913581b57796a820fb7e373457ace9bad

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]