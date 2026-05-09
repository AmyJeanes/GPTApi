FROM python:3.14@sha256:511f025a0718f01b977d5ad572bc431745b31887ceccc538c85b87e82ad2956f

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]