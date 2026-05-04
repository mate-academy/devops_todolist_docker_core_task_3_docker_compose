#!/bin/sh
until python manage.py migrate; do
    echo "DB not ready, retrying in 3s..."
    sleep 3
done
python manage.py runserver 0.0.0.0:8080

