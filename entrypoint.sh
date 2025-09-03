#!/bin/sh

until mysqladmin ping -h db -P 3306 --silent; do
  sleep 3
done

python manage.py makemigrations
python manage.py migrate
python manage.py runserver 0.0.0.0:8080
