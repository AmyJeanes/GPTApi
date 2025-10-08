FROM python:3.13@sha256:4889af0e45f04b7c5dd741421a1280919499d38d3125d714b69fa86b23b1052a

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]