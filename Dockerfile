FROM python:3.14@sha256:2a8b92a1e9eb6ef2c888eb7e6c91283788c6d613fdc8fc22e12346aff7c4406d

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]