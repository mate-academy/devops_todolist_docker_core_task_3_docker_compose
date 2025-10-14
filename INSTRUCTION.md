Переконайся, що Docker і Docker Compose встановлені.
Клонуй репозиторій:
git clone <твій_fork_репозиторію>
cd django-todolist

Збери контейнери:
docker-compose build

Запусти контейнери:
docker-compose up

Відкрий браузер:
Django app → http://localhost:8000
API → http://localhost:8000/api/

Зупинити всі контейнери:
docker-compose down

Зупинити та видалити всі дані БД:
docker-compose down -v

Дані:
Todos зберігаються у MySQL контейнері, у volume db-data
Дані не зникають після перезапуску контейнера, поки не видалити volume