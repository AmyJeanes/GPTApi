FROM python:3.13@sha256:3efe6d5302c6131cbfbdb089c0dff7cf5a85ae5675c025df8488da10010acced

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]