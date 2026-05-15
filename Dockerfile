FROM python:3.14@sha256:89a288a9a9e9141b9f0c51744c358138da6369897792f1af3f5425e407d9529a

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]