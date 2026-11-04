# Django ToDo List — Docker Compose Instructions

## Requirements

Before starting, make sure Docker and Docker Compose are installed and Docker is running.

## Start the application

1. Open a terminal in the project directory.
2. Build and start the containers:

   ```bash
   docker compose up --build -d
   ```

3. Wait until MySQL is healthy and Django has started.
4. Open the application in your browser:

   http://localhost:8080

## Check running containers

```bash
docker compose ps
```

## View container logs

```bash
docker compose logs -f
```

Press `Ctrl+C` to stop following the logs without stopping the containers.

## Stop the application

Stop containers without removing them:

```bash
docker compose stop
```

Start stopped containers again:

```bash
docker compose start
```

## Stop and remove containers

```bash
docker compose down
```

This removes the containers and project network but preserves the named MySQL volume.

## Persistent database storage

MySQL data is stored in the named Docker volume `mysql_data`.

The data remains available after running `docker compose down` and starting the application again.

**Warning:** Running `docker compose down -v` removes the project's named volumes and deletes the stored database data.

## Rebuild the application

After changing the Dockerfile or application dependencies, rebuild and start the containers:

```bash
docker compose up --build -d
```