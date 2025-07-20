FROM python:3.8

WORKDIR /app

# Встановлюємо netcat-openbsd для очікування MySQL
RUN apt-get update && apt-get install -y netcat-openbsd && apt-get clean

COPY . .

RUN pip install --upgrade pip && pip install -r requirements.txt

EXPOSE 8080

ENTRYPOINT ["sh", "entrypoint.sh"]
