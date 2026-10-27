FROM python:3.14@sha256:a2f0ffaafb5db81c0583026054d9290ef210a6bd614acad35ea483fea0cbcab2

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]