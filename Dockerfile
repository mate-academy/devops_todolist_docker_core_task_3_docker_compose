FROM python:3.8

WORKDIR /app

# netcat для перевірки підключення до MySQL
RUN apt-get update && apt-get install -y netcat-openbsd

COPY . .

RUN pip install --upgrade pip && pip install -r requirements.txt

EXPOSE 8080

ENTRYPOINT ["sh", "entrypoint.sh"]
