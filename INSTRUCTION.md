# Docker Compose Instructions

## Prerequisites

Make sure Docker and Docker Compose are installed and running.

Clone the repository and navigate to the project directory:

```bash
git clone https://github.com/steelpush-aqa/devops_todolist_docker_core_task_3_docker_compose.git
cd devops_todolist_docker_core_task_3_docker_compose
```

## Start the application

Build the Docker images and start all services:

```bash
docker compose up -d --build
```

This command:

- builds the MySQL image using `Dockerfile.mysql`
- builds the Django application image using `Dockerfile`
- creates the Docker Compose network
- creates the persistent MySQL volume
- starts the MySQL container
- starts the Django application container
- runs Django database migrations when the application container starts

The application is available at:

http://localhost:8080

## Check running containers

To check the status of the services:

```bash
docker compose ps
```

Both `mysql` and `pythonapp` containers should have the status `Up`.

## View application logs

To view logs from the Django application:

```bash
docker compose logs pythonapp
```

To view MySQL logs:

```bash
docker compose logs mysql
```

To follow the logs in real time:

```bash
docker compose logs -f
```

## Stop the application

To stop and remove the containers and the Docker Compose network:

```bash
docker compose down
```

The named `db-data` volume is not removed by this command.

## Start the application again

After `docker compose down`, the application can be started again with:

```bash
docker compose up -d
```

The existing Docker images are reused and the existing MySQL volume is attached to the newly created MySQL container.

## Persistent database storage

MySQL data is stored in the named Docker volume:

```
db-data:/var/lib/mysql
```

The volume allows the database data to survive container removal. For example:

```bash
docker compose down
docker compose up -d
```

removes and recreates the containers, but the MySQL data remains available because the `db-data` volume is preserved.

To remove the containers, network, and database volume, use:

```bash
docker compose down -v
```

**Warning:** removing the volume deletes the persistent MySQL database data.

## Docker Compose services

The project contains two services:

### MySQL

- Service name: `mysql`
- Port: `3306`
- Database: `app_db`
- User: `app_user`
- Persistent volume: `db-data`
- Dockerfile: `Dockerfile.mysql`

### Django application

- Service name: `pythonapp`
- Port: `8080`
- Dockerfile: `Dockerfile`
- Depends on the MySQL service
- Runs database migrations before starting Django

The Django application connects to MySQL using the Compose service name:

```
mysql
```

rather than a container IP address.

## Rebuild the application

If the Dockerfile or application source code changes, rebuild the images:

```bash
docker compose up -d --build
```