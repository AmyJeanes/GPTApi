FROM python:3.14@sha256:6928095b5c67225857e608dd95271a81e8bb134e4bf7e7c305a9cdc2502a1d06

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]