# Instruction: Running the Todolist App with Docker Compose

This project uses `docker-compose.yml` to build and run two containers:

- **mysql** — MySQL database with a persistent volume (`db-data`) for storing data
- **pythonapp** — Django Todolist application (runs migrations on startup, then starts the server)

## Prerequisites

- Docker
- Docker Compose (v2, `docker compose`, or the standalone `docker-compose`)

## Start the containers

Build the images and start both containers in the background:

```bash
docker-compose up --build -d
```

On startup, the app container automatically runs `python manage.py migrate` against the MySQL database and then starts the Django server.

The application will be available at:

- http://localhost:8080/ — landing page
- http://localhost:8080/api/ — API

## Check status / logs

```bash
docker-compose ps
docker-compose logs -f pythonapp
docker-compose logs -f mysql
```

## Stop the containers

Stop and remove the containers (the `db-data` volume and its data are kept):

```bash
docker-compose down
```

## Stop and remove data

To also delete the MySQL data (the persistent volume), add `-v`:

```bash
docker-compose down -v
```

## Notes

- Todos are stored in the MySQL database, persisted in the `db-data` named volume, so data survives container restarts (`docker-compose down` without `-v`, followed by `docker-compose up`).
- If you change `Dockerfile`, `Dockerfile.mysql`, or `requirements.txt`, rebuild with `docker-compose up --build`.
