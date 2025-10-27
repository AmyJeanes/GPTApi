FROM python:3.14@sha256:78ad0471881f0232093c9e6edf58addade7bf106377732e0790c0f0c914b3b7b

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]