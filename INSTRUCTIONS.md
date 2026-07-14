# Instructions

## 1. Build and run with Docker Compose

docker-compose up --build -d

This command builds both images and starts two containers:
- `mysql` — MySQL database
- `pythonapp` — Flask application

## 2. Access the application

http://localhost:8081

## 3. Stop containers

docker-compose down

## 4. View logs

docker-compose logs -f

## 5. Project structure

app.py
Dockerfile
Dockerfile.mysql
docker-compose.yml
requirements.txt
init.sql
INSTRUCTIONS.md

## 6. Notes

- MySQL runs in a separate container, not inside the app image.
- The app connects to MySQL via the container name `mysql` as hostname.
- The healthcheck ensures the app starts only after MySQL is ready.
- Data is persisted via the `db-data` volume.