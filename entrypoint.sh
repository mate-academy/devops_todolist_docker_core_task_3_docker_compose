#!/bin/sh
set -e

echo "Running migrations..."
python manage.py migrate --noinput

echo "Starting the server..."
exec python manage.py runserver 0.0.0.0:8080
