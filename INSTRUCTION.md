# Running the Todolist app with Docker Compose

This project runs two containers:

- **db**: MySQL, built from `Dockerfile.mysql`. Data is stored in the named volume `mysql_data`, so todos survive restarts.
- **app**: the Django Todolist application, built from `Dockerfile`. On startup it runs database migrations and then starts the server on port 8080.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) with Docker Compose installed
- Port `8080` free on your machine
- In `todolist/settings.py`, the database `HOST` must be set to `'db'` (the compose service name)

## Start the containers

From the project root (where `docker-compose.yml` is located):

```bash
docker-compose up --build
```

(With newer Docker versions you can use `docker compose up --build`.)

What happens:

1. The MySQL image and the app image are built.
2. The `db` container starts and Compose waits until its healthcheck passes.
3. The `app` container starts, applies migrations (`python manage.py migrate`) and launches the Django server.

To run in the background, add `-d`:

```bash
docker-compose up --build -d
```

## Open the application

- Landing page: http://localhost:8080/
- API: http://localhost:8080/api/

## View logs

```bash
docker-compose logs -f          # all services
docker-compose logs -f app      # app only
docker-compose logs -f db       # database only
```

## Check container status

```bash
docker-compose ps
```

## Stop the containers

Press `Ctrl+C` if running in the foreground, or:

```bash
docker-compose stop
```

This stops the containers without removing them. Restart them with `docker-compose start`.

## Stop and remove the containers

```bash
docker-compose down
```

Containers and the network are removed, but the `mysql_data` volume is kept, so your todos are preserved the next time you run `docker-compose up`.

## Remove everything, including the database data

```bash
docker-compose down -v
```

**Warning:** this deletes the `mysql_data` volume and all stored todos.

## Troubleshooting

- **App cannot connect to the database:** make sure `HOST` in `todolist/settings.py` is `'db'`, then rebuild with `docker-compose up --build`.
- **Port 8080 already in use:** stop the other process, or change the host port in `docker-compose.yml` (for example `"8081:8080"`).
- **Changes to code or Dockerfiles not applied:** rebuild with `docker-compose up --build`.
