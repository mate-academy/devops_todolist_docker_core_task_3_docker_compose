# Running the application with Docker Compose

## Prerequisites

- Docker Desktop must be installed and running.
- Run all commands from this project directory.

Check that Docker and Docker Compose are available:

```sh
docker --version
docker compose version
```

> Docker Compose v2 uses `docker compose` (with a space), not the older
> `docker-compose` command.

## Start the application

Build the images and start the MySQL and Django containers:

```sh
docker compose up --build
```

This command keeps the logs in the terminal. Once the application has started,
open <http://localhost:8080>.

To run the containers in the background instead, use:

```sh
docker compose up --build -d
```

View logs while running in the background:

```sh
docker compose logs -f
```

Check the running services:

```sh
docker compose ps
```

## Stop the application

If Compose is running in the foreground, press `Ctrl+C`.

To stop and remove the project containers and network, while preserving the
MySQL data volume, run:

```sh
docker compose down
```

To stop containers without removing them, run:

```sh
docker compose stop
```

Start stopped containers again with:

```sh
docker compose start
```

## Reset the database (optional)

The `db-data` Docker volume keeps MySQL data between container restarts. To
delete all stored database data and start with a fresh database, run:

```sh
docker compose down -v
```

This command permanently removes the database volume.
