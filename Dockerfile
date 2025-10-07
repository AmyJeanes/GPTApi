FROM python:3.13@sha256:fe841081ec55481496a4ab25e538833741295d57d2abdec8d38d74d65fb4715b

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]