FROM python:3.15@sha256:46837ed3105db0029b6d656816185c6258e3b39690532fb782428e0a5fd76182

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]