FROM python:3.14@sha256:0b45a7265e3d6f3cbe81b09907772245c4c319b8bc8fb9f5a4088cd2b7ba66c6

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]