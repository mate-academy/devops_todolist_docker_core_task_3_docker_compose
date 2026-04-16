# INSTRUCTION.md
## Кратко
Этот файл объясняет, как собрать, запустить и остановить стек (Django + MySQL) через docker-compose, а также как выполнить миграции и проверить работу приложения.
## Предварительные требования
- Установлены Docker и Docker Compose.
- Python/venv не обязательны — всё запускается в контейнерах.
- В проекте должен быть рабочий `docker-compose.yml` и Dockerfile(ы).
- Рекомендуется проверить/установить в `docker-compose.yml`:
  - сервис приложения (например `pythonapp`), проброс порта (например `8080:8080`);
  - сервис базы (например `my-sql`), volume для персистентности и проброс порта (например `3306:3306`);
  - переменные окружения для БД (DB_USER, DB_PASSWORD, MYSQL_DATABASE и т.д.).


## Сборка и запуск
1. Собрать образы и запустить сервисы в фоне:
   docker-compose up -d --build


2. Проверить статус контейнеров:
   docker-compose ps
   или
   docker ps


## Миграции и создание суперпользователя
(Не выполнять миграции на этапе сборки — делаем это после старта контейнеров.)
1. Выполнить миграции:
   docker-compose exec pythonapp python manage.py migrate


2. (Опционально) Создать суперпользователя:
   docker-compose exec pythonapp python manage.py createsuperuser


3. Если приложение ожидает готовности БД, можно повторить миграции при необходимости:
   docker-compose exec pythonapp python manage.py migrate --noinput


## Просмотр логов
- Логи всех сервисов:
  docker-compose logs -f


- Логи конкретного сервиса:
  docker-compose logs -f pythonapp


## Остановка и удаление
- Остановить контейнеры (оставить тома/образы):
  docker-compose down


- Остановить и удалить контейнеры и сети:
  docker-compose down


- Остановить и удалить контейнеры, сети и тома (удалит данные MySQL):
  docker-compose down -v


- Удалить образы (если нужно перестроить совсем с нуля):
  docker-compose down --rmi all -v


## Доступ к веб‑интерфейсу и БД
- Веб‑приложение: http://localhost:8080 (порт — пример, см. docker-compose.yml)
- MySQL (если проброшен порт 3306): подключаться через клиент:
  mysql -h 127.0.0.1 -P 3306 -u <DB_USER> -p
  или
  docker-compose exec my-sql mysql -u<DB_USER> -p <MYSQL_DATABASE>


## Персистентность данных
- В docker-compose.yml для MySQL должен быть volume, пример:
  volumes:
    - db_data:/var/lib/mysql


- Чтобы сохранить данные между перезапусками — не использовать `docker-compose down -v`.


## Типовые проверки при проблемах
- Контейнеры запущены? — docker-compose ps
- Приложение слушает порт? — curl http://localhost:8080 или открыть в браузере.
- БД доступна из контейнера приложения:
  docker-compose exec pythonapp sh -c "nc -zv my-sql 3306"  (или использовать `ping`/`telnet`/`mysql` в контейнере)
- Логи ошибок приложения/БД:
  docker-compose logs pythonapp
  docker-compose logs my-sql
- Убедись, что настройки в `todolist/settings.py` читают переменные окружения (DB_HOST должен быть имя сервиса `my-sql`, а не локальный IP).


## Рекомендации
- Не выполнять `python manage.py migrate` в Dockerfile (в RUN), делать это в entrypoint или через `docker-compose exec` после старта контейнеров.
- Добавить скрипт ожидания (wait-for-db) или в ENTRYPOINT сделать `sh -c "while ! nc -z my-sql 3306; do sleep 1; done && python manage.py migrate && gunicorn ..."` чтобы приложение стартовало после готовности БД.
- Хранить конфиденциальные данные в `.env` файле (и добавить его в .gitignore), а в docker-compose ссылаться на него через `env_file`.


## Примеры команд (сводка)
- Сборка и запуск: docker-compose up -d --build
- Выполнить миграции: docker-compose exec pythonapp python manage.py migrate
- Просмотр логов: docker-compose logs -f
- Остановка: docker-compose down
- Полное удаление данных: docker-compose down -v


Если хочешь, могу подготовить INSTRUCTION.md адаптированный под твой конкретный `docker-compose.yml` — пришли его содержимое, и я подгоню команды и порты под твой стек.