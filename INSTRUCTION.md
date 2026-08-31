# Django Todolist — Docker Compose Instructions

## Prerequisites

Make sure Docker and Docker Compose are installed.

## Build and start containers

Run the following command from the project root:

```bash
docker compose up --build
```

This command builds the Django Todolist and MySQL images and starts both containers.

The Django application will be available at:

```text
http://localhost:8080
```

## Run containers in the background

To start the application in detached mode:

```bash
docker compose up --build -d
```

## Check running containers

```bash
docker compose ps
```

## View application logs

```bash
docker compose logs app
```

## View MySQL logs

```bash
docker compose logs mysql
```

## Stop containers

To stop the running containers:

```bash
docker compose stop
```

## Stop and remove containers

To stop and remove the containers:

```bash
docker compose down
```

The MySQL data is stored in the persistent `mysql_data` Docker volume, so removing the containers does not remove the database data.

## Remove containers and the database volume

To remove the containers and the persistent database volume:

```bash
docker compose down -v
```

This command permanently removes the MySQL data stored in the Docker volume.

## Restart the application

```bash
docker compose restart
```

## Rebuild the application

After changing the Dockerfile or application source, rebuild the containers with:

```bash
docker compose up --build
```
