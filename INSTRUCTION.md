# Запуск через Docker Compose

## Вимоги
- Встановлений Docker і Docker Compose

## Запуск
1. Клонувати репозиторій та перейти в його директорію.
2. Виконати:

docker-compose up --build

   Ця команда збере образ застосунку, підніме MySQL та застосунок,
   застосує міграції автоматично при старті контейнера `web`.
3. Відкрити застосунок у браузері: http://localhost:8080/

## Зупинка
- Зупинити контейнери, зберігши дані в БД:

docker-compose down

- Зупинити і **видалити** дані MySQL (persistent volume):

docker-compose down -v


## Примітки
- Дані MySQL зберігаються в named volume `mysql_data`,
  тож вони переживають `docker-compose down` / `up`.
- Порт застосунку: 8080, порт MySQL: 3306.