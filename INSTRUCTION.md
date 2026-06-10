# Docker Compose Instructions

## What this setup does

- Builds the Django Todolist application from `Dockerfile`
- Starts a MySQL 8.0 container
- Stores MySQL data in a persistent Docker volume
- Runs Django migrations automatically before starting the app

## Prerequisites

- Docker
- Docker Compose

## Start the containers

Run this command from the project root:

```bash
docker compose up --build
```

If your Docker version still uses the legacy command, run:

```bash
docker-compose up --build
```

After startup, the application will be available at:

- `http://localhost:8000`

## Stop the containers

To stop the containers while keeping the MySQL volume:

```bash
docker compose down
```

If you want to stop the containers and remove the persistent database volume:

```bash
docker compose down -v
```

## Notes

- The application container waits for the MySQL service to become healthy before running migrations.
- Database credentials are defined in `docker-compose.yml` and passed to Django through environment variables.
- The `mysql_data` volume keeps todos and other database records between restarts.
