#!/bin/sh
set -e

echo "Waiting for MySQL..."
until mysqladmin ping -h"$DB_HOST" -P"$DB_PORT" --silent; do
  sleep 1
done

echo "MySQL is up - running migrations..."
python manage.py migrate

echo "Starting Django server..."
python manage.py runserver 0.0.0.0:8000