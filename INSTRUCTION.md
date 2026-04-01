Install Docker and Docker Compose

Clone the repository:

bash
git clone <repository_url>
cd <repository_folder>
Ensure the following files exist in the project root: Dockerfile, docker-compose.yml, requirements.txt

Build and run locally: docker-compose up --build

Run in detached mode: docker-compose up --build -d

Check running containers: docker ps

View web service logs: docker logs app-web --tail 100 -f

View database logs: docker logs app-db --tail 100 -f

Access the application in browser: http://localhost:8000

Access API: http://localhost:8000/api/

Stop containers: docker-compose down

Stop and remove volumes (delete all DB data): docker-compose down -v

Database persistence: db-data volume stores MySQL data, use docker-compose down -v to reset completely

Port mapping: 8000:8000 for web, 3306:3306 for MySQL, ensure ports are free

Troubleshooting:

ModuleNotFoundError: No module named 'django' → check requirements.txt, rebuild with docker-compose build --no-cache web, ensure Dockerfile has COPY requirements.txt . and RUN pip install -r requirements.txt

Migrations fail because DB not ready → add wait loop until nc -z db 3306; do sleep 1; done, check env variables DB_HOST=db, DB_NAME=app_db, DB_USER=app_user, DB_PASSWORD=1234, DB_PORT=3306

OperationalError (DB connection) → check credentials and DB name in docker-compose.yml, verify MySQL logs with docker logs app-db

Developer commands:

Enter web container: docker exec -it app-web sh

Check installed libraries: pip freeze

Run migrations manually: python manage.py migrate --noinput

Create superuser: python manage.py createsuperuser

Init SQL scripts run only on first DB volume initialization; to re-run, remove volume with docker-compose down -v