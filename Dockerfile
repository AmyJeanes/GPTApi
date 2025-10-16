FROM python:3.13@sha256:75ba988a6cd84bb048a05fafae370a2f4600344b844d53ef90730d3518802f67

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]