# Running Django Todolist with Docker Compose

## Prerequisites

Install Docker with Docker Compose. Make sure Docker is running
and port 8080 is available.

Run all commands from the project directory containing docker-compose.yml.

## Build and start

Build the images and start the containers in the background:

```bash
docker compose up --build -d
```

Compose starts MySQL and waits until its health check passes.
Then Django runs database migrations and starts the application.

Open the application:
http://localhost:8080

API:
http://localhost:8080/api/

## Check container status

```bash
docker compose ps
```

## View logs

```bash
docker compose logs -f
```

Press Ctrl+C to stop following the logs. Containers will keep running.

## Stop containers

Stop the containers without removing them:

```bash
docker compose stop
```

Start the stopped containers again:

```bash
docker compose start
```

## Stop and remove containers

```bash
docker compose down
```

This removes the containers and the project network.
Database data remains in the named volume.

To create and start the containers again:

```bash
docker compose up -d
```

## Data persistence

MySQL stores its data in the mysql_data volume mounted at
/var/lib/mysql inside the database container.

To check persistence, create a todo in the application, run
docker compose down, then docker compose up -d.
Open the application and check that the todo is still present.

## Delete all database data

WARNING: The following command removes the containers AND the
database volume. All saved accounts and todos will be deleted.

```bash
docker compose down -v
```

## MySQL image configuration

The db service builds its image from Dockerfile.mysql in the repository root.
This file defines the MySQL database and credentials.
Docker Compose mounts the mysql_data volume at /var/lib/mysql.