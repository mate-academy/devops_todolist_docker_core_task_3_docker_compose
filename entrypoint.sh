#!/bin/sh

# Чекаємо, поки MySQL буде доступним (по імені сервісу, не IP)
echo "⏳ Очікуємо запуск MySQL..."
until nc -z -v -w30 db 3306
do
  echo "❌ MySQL ще не готовий - чекаємо 5 секунд..."
  sleep 5
done

echo "✅ MySQL готовий — запускаємо Django!"
python manage.py migrate
python manage.py runserver 0.0.0.0:8080
