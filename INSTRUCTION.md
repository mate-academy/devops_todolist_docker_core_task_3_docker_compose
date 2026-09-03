# ToDo App — Docker Instructions

## Docker Hub

App image repository: [artemzakharchukhome/todoapp](https://hub.docker.com/repository/docker/artemzakharchukhome/todoapp/general)

MySQL image repository: [artemzakharchukhome/mysql-local](https://hub.docker.com/repository/docker/artemzakharchukhome/mysql-local/general)

## Build and run

From the project root directory:

```bash
docker compose up --build
```

To run in the background:

```bash
docker compose up --build -d
```

## Rebuild after code changes

If you change application code or Docker configuration, rebuild the images:

```bash
docker compose build
```

Or rebuild and start in one step:

```bash
docker compose up --build
```

## View logs

Follow logs from all services:

```bash
docker compose logs -f
```

Logs for a specific service:

```bash
docker compose logs -f app
docker compose logs -f mysql
```

## Persistent volume

MySQL data is stored in a Docker volume named `mysql_data`. This volume keeps todos and database data across container restarts and `docker compose down`.

To remove containers **and** delete all stored data:

```bash
docker compose down --volumes
```

> **Warning:** `--volumes` permanently deletes all todos and database data.

## Stop containers

Stop and remove containers (volume is preserved):

```bash
docker compose down
```

## Access the application in a browser

After both containers are running, open:

- Landing page: [http://localhost:8080/](http://localhost:8080/)
- API: [http://localhost:8080/api/](http://localhost:8080/api/)
