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

Переглянути логи:
docker-compose logs -f app

Зупинити контейнери:
docker-compose down

Дані:
Todos зберігаються у MySQL контейнері, у volume db-data
Дані не зникають після перезапуску контейнера, поки не видалити volume