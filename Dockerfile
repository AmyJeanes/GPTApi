FROM python:3.14@sha256:b9767f56a1cc620aa72d38cc3557d26412e38a4597c92953476136b78894ccbd

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]