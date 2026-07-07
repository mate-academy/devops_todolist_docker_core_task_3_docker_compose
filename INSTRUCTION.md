# Instructions

## Запуск проєкту

1. Клонуй репозиторій:
   git clone <url>
   cd <project-folder>

2. Збери та запусти контейнери:
   docker-compose up --build

3. Застосунок буде доступний за адресою:
   http://localhost:8081

## Зупинка контейнерів

Щоб зупинити контейнери (без видалення даних):
   docker-compose stop

Щоб зупинити і видалити контейнери (volume з даними MySQL залишиться):
   docker-compose down

Щоб зупинити і видалити контейнери разом з volume (повне очищення бази):
   docker-compose down -v