FROM python:3.13@sha256:ede46d7778a7ebac1e2f5253cdb9b59d3928c736b280636f68dcc60250619a03

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]