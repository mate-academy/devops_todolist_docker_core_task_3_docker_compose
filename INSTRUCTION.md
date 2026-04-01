Потрібно: Docker і Docker Compose.


Клон репозиторій:
git clone <repository_url>
cd <repo_folder>


Переконайся, що в корені проекту є:

Dockerfile
docker-compose.yml
requirements.txt



Побудова та запуск (локально, у терміналі):
docker-compose up --build
Щоб запустити у фоновому режимі:
docker-compose up --build -d


Перевірка запуску

Подивитися список контейнерів:
docker ps
Логи веб-сервісу:
docker logs app-web --tail 100 -f
Логи БД:
docker logs app-db --tail 100 -f



Доступ до застосунку

Відкрий у браузері: http://localhost:8000
API: http://localhost:8000/api/



Зупинка і очищення


Зупинити:
docker-compose down


Зупинити і видалити томи (видалить усі дані БД):
docker-compose down -v


Важливі примітки

Персистентність БД: том db-data у docker-compose зберігає дані MySQL у каталозі контейнера. Використовуй docker-compose down -v, якщо хочеш повністю очистити базу.
Port mapping: у цьому проєкті проброс портів налаштовано як 8000:8000 (веб) і 3306:3306 (MySQL). Переконайся, що ці порти вільні на хості.

Діагностика типових проблем


ModuleNotFoundError: No module named 'django'

Переконайся, що requirements.txt є і що образ був перебудований після змін:
docker-compose build --no-cache web
Перевір, що Dockerfile містить:
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt



Міграції не виконуються через те, що БД ще не готова

Образ веб-сервісу очікує доступності БД перед викликом python manage.py migrate. Переконайся, що в docker-compose.yml є цикл очікування:
until nc -z db 3306; do sleep 1; done
Перевір змінні оточення у docker-compose.yml:
DB_HOST=db
DB_NAME=app_db
DB_USER=app_user
DB_PASSWORD=1234
(за потреби додай DB_PORT=3306)



Помилка підключення до БД (OperationalError)

Перевір облікові дані та імʼя БД у docker-compose.yml.
Переконайся, що MySQL стартував і не має помилок (див. логи app-db).



Команди для розробника / налагодження

Зайти в контейнер web:
docker exec -it app-web sh
Перевірити встановлені бібліотеки:
pip freeze
Запустити міграції вручну:
python manage.py migrate --noinput
Створити суперюзера:
python manage.py createsuperuser


docker-compose up --build -d
docker-compose up --build
docker-compose down
docker-compose down -v
docker-compose restart web
docker-compose exec web python manage.py migrate


 init SQL виконується лише при першій ініціалізації тома і як видалити том, якщо треба (docker-compose down -v).