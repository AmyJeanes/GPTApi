FROM python:3.14@sha256:0ce7b4ec2e64fd25c360823a58840e1537c1e8b735b86aad8016828456f9ed82

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]