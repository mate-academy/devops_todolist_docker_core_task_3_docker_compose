# Docker Compose Instructions

This project runs as two containers:

- `db`: MySQL with a persistent volume
- `app`: Django Todolist application

## Prerequisites

- Docker Engine
- Docker Compose v2

## Start the stack

Run the following command from the repository root:

```bash
docker compose up --build
```

This will:

- build the MySQL image from `Dockerfile.mysql`
- build the Django app image from `Dockerfile`
- create the `mysql_data` volume
- start the MySQL container
- wait until MySQL is healthy
- run Django migrations
- start the web application on `http://localhost:8000`

## Stop the stack

To stop containers but keep the database volume:

```bash
docker compose down
```

To stop containers and remove the persistent volume:

```bash
docker compose down -v
```

## Useful commands

View logs:

```bash
docker compose logs -f
```

Rebuild images after code changes:

```bash
docker compose up --build
```

## Application URLs

- Application: `http://localhost:8000`
- API: `http://localhost:8000/api/`

## Persistence

Database data is stored in the named volume `mysql_data`, so it survives container restarts and `docker compose down`.
