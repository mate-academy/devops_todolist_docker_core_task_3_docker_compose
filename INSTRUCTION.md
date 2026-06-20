# Instructions

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed
- [Docker Compose](https://docs.docker.com/compose/install/) installed

## Run containers

Build images and start both the MySQL database and the Todolist application:

```bash
docker-compose up --build
```

To run in detached (background) mode:

```bash
docker-compose up --build -d
```

The application will be available at [http://localhost:8081](http://localhost:8081).

## Stop containers

Stop and remove containers (volumes are preserved):

```bash
docker-compose down
```

