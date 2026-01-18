#!/bin/sh
# wait-for-it.sh

# Ми просто вказуємо хост прямо в циклі або через першу змінну
HOST=$1
shift
# Все інше після першого аргументу - це команда
CMD="$@"

until nc -z "$HOST" 3306; do
  echo "Waiting for MySQL at $HOST..."
  sleep 1
done

echo "MySQL is up - executing command: $CMD"
# Виконуємо команду через sh -c, щоб точно спрацював оператор &&
exec sh -c "$CMD"