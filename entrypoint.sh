#!/bin/sh

# Wait for MySQL to be ready
while ! nc -z $MYSQL_HOST 3306; do
  echo "Waiting for MySQL..."
  sleep 2
done

# Apply migrations
python manage.py migrate

# Start server
python manage.py runserver 0.0.0.0:8080