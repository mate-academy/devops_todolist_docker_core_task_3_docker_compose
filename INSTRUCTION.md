# Docker Compose Instructions

This project runs a Django Todolist application and MySQL database using Docker Compose.

## Prerequisites

- Docker installed and running
- Docker Compose available

## Start the application

From the project root directory, run:

```bash
docker-compose up
```

This command builds and starts the MySQL database and Django application.

To rebuild the images before starting:

```bash
docker-compose up --build
```

To run the containers in detached mode:

```bash
docker-compose up -d
```

To rebuild the images and run the containers in detached mode:

```bash
docker-compose up -d --build
```

The Django application is available at:

```text
http://localhost:8080
```

The Todolist page is available at:

```text
http://localhost:8080/todolist/1/
```

## Check container status

To check running containers:

```bash
docker-compose ps
```

## View logs

To view logs from all services:

```bash
docker-compose logs
```

To follow logs in real time:

```bash
docker-compose logs -f
```

To view only the Django application logs:

```bash
docker-compose logs -f app
```

To view only MySQL logs:

```bash
docker-compose logs -f mysql
```

## Stop the application

To stop and remove the containers and Docker Compose network:

```bash
docker-compose down
```

This command does not remove the `mysql_data` volume, so the MySQL data is preserved.

## Remove containers and database volume

If you want to remove the containers and also delete the persistent MySQL volume, use:

```bash
docker-compose down -v
```

Use this command only when you intentionally want to delete the MySQL database data.

## Persistent MySQL data

MySQL uses the named Docker volume:

```text
mysql_data
```

The volume is mounted to:

```text
/var/lib/mysql
```

The volume keeps the database data when the containers are removed with:

```bash
docker-compose down
```

The data will be reused when the project is started again with:

```bash
docker-compose up -d
```

## Typical workflow

Start the project:

```bash
docker-compose up -d
```

Check the services:

```bash
docker-compose ps
```

Follow the logs:

```bash
docker-compose logs -f
```

Stop the project:

```bash
docker-compose down
```

If Dockerfiles or dependencies were changed, rebuild the images:

```bash
docker-compose up --build
```