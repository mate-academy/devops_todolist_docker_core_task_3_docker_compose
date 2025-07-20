#!/bin/sh

echo "⏳ Очікуємо запуск MySQL (${DB_HOST}:${DB_PORT})..."

MAX_TRIES=40
TRIES=0

while ! nc -z $DB_HOST $DB_PORT; do
  TRIES=$((TRIES+1))
  if [ $TRIES -ge $MAX_TRIES ]; then
    echo "❌ Не вдалося підключитись до MySQL після $MAX_TRIES спроб."
    exit 1
  fi
  echo "❌ MySQL ще не готовий (залишилось спроб: $((MAX_TRIES - TRIES))) - чекаємо 3 секунди..."
  sleep 3
done

echo "✅ MySQL готовий — запускаємо Django міграції та сервер!"

python manage.py migrate
python manage.py runserver 0.0.0.0:8080
