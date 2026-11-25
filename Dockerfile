FROM python:3.15@sha256:e4bc83a3314d078d651f06c8440e9a03ba892ee2f6577437f174abd8731fb343

WORKDIR /app

COPY requirements.txt requirements.txt
COPY install.sh install.sh

RUN chmod +x install.sh && ./install.sh

COPY . .

EXPOSE 80
ENTRYPOINT [ "gunicorn", "app", "--timeout", "60", "--bind", "0.0.0.0:80" ]