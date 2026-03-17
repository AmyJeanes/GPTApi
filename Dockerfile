FROM python:3.14@sha256:0040600478fe761fbaea26b16cb4ce1b520e5aa1cef26d0762c538ece5892c02

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]