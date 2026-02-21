# INSTRUCTION

This project runs a Django Todolist application with a MySQL database using Docker Compose.

## Prerequisites
- Docker Engine / Docker Desktop installed
- Docker Compose v2 (use `docker compose`)

## Start (foreground)
From the repository root:
```bash
docker compose up --build
```

## Start (detached mode)
Run services in the background without blocking the terminal:
```bash
docker compose up -d --build
```

## View logs
Stream live logs from all running containers:
```bash
docker compose logs -f
```

## Stop the services
Stop all running containers without removing volumes:
```bash
docker compose down
```

## Stop services and remove volume
Stop all containers and delete the persistent database volume:
```bash
docker compose down -v
```