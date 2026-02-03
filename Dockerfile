FROM python:3.14@sha256:c951a589819a647ef52c8609a8ecf50a4fa23eab030500e3d106f3644431ff30

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]