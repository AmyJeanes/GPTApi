FROM python:3.13@sha256:99100de0b8685fedd2d686d4a1ded176486825cf54fec5c32da7c64f01936920

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]