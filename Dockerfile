FROM python:3.14@sha256:0abd92bfb95474ec37a2348257752941e27ecbbaa6e42debc26a7a91d96bfbc4

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]