FROM python:3.14@sha256:fbf695a1b7e4fd39dfac43165c0da0949262531ecd8e901abe641d79f596af80

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]