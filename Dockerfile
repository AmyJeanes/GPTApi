FROM python:3.14@sha256:3de5d55a43a58c09ed47952b15d87ea8d18d82bc616a9277b9ddd0e6dd25b3f0

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]