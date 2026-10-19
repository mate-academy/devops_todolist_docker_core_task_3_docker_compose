# Running Todolist with Docker Compose

## Prerequisites

- Docker and Docker Compose installed

## Start

Build images and start the app and MySQL:

```
docker compose up --build
```

Or in the background:

```
docker compose up --build -d
```

On startup the app container applies migrations and then starts the server.
Open http://localhost:8080

## View logs

```
docker compose logs -f app
```

## Stop

Stop and remove containers (data is kept in the volume):

```
docker compose down
```

## Stop and delete all data

Removes containers and the MySQL volume:

```
docker compose down -v
```

## Data persistence

Todos are stored in MySQL. Data lives in the `mysql_data` Docker volume
and survives `docker compose down` and restarts.
