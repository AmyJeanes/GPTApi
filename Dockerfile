FROM python:3.13@sha256:3b2f1b9c9948e9dc96e1a2f4668ba9870ff43ab834f91155697476142b3bc299

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]