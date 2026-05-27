# Docker Compose instructions

## Start

Build and start the MySQL database and Django application:

```bash
docker compose up --build
```

The application will be available at:

```text
http://localhost:8080
```

The app container runs migrations automatically before starting Django.

## Stop

Stop containers but keep the MySQL data volume:

```bash
docker compose down
```

Stop containers and remove the MySQL data volume:

```bash
docker compose down -v
```

## Database settings

The Django app uses these defaults inside Docker Compose:

```text
MYSQL_HOST=db
MYSQL_PORT=3306
MYSQL_DATABASE=app_db
MYSQL_USER=app_user
MYSQL_PASSWORD=1234
```
