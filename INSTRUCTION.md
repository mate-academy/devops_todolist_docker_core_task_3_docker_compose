# Docker Compose Instructions

## Start the application

Build and start the Django Todolist app with MySQL:

```bash
docker compose up --build
```

After the containers start, open the application:

```text
http://localhost:8080
```

## Run in the background

```bash
docker compose up --build -d
```

## Stop containers

```bash
docker compose down
```

## Stop containers and remove the MySQL volume

Use this only when you want to delete persisted database data:

```bash
docker compose down -v
```

## Check logs

```bash
docker compose logs -f
```
