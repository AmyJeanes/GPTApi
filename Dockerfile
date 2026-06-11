FROM python:3.14@sha256:f75eeaeed5bcf8fb912857396cc466727f20dccfec5ecbf555936ea3f950d2f4

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]