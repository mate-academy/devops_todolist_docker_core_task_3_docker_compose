#!/bin/sh

# Wait for MySQL to be ready
echo "Waiting for MySQL..."
until nc -z db 3306; do
  sleep 3
done
echo "MySQL is up - continuing..."

# Run migrations and start the server
python manage.py migrate
python manage.py runserver 0.0.0.0:8000