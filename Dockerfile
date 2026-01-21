FROM python:3.14@sha256:17bc9f1d032a760546802cc4e406401eb5fe99dbcb4602c91628e73672fa749c

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]