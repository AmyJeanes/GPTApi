FROM python:3.14@sha256:90bdf58a84b9ed919c2942fddafd6c4c8256b22073cc95ecd2710ea255671eba

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]