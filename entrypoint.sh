#!/bin/bash

python manage.py migrate

if [ $? -eq 0 ]; then
    python manage.py runserver 0.0.0.0:8080
else
    echo "Migrations failed, exiting..."
    exit 1
fi