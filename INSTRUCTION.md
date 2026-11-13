# Running the Todolist app with Docker Compose

## Prerequisites

- Docker and Docker Compose installed
- Port 8080 free on your machine

## Start the containers

Build the images and start both MySQL and the Todolist app:

```bash
docker-compose up --build
```

To run in the background (detached mode):

```bash
docker-compose up --build -d
```

On startup the app container automatically applies database migrations
and then starts the Django server.

The application is available at: http://localhost:8080

## View logs

```bash
docker-compose logs -f
```

## Check running containers

```bash
docker-compose ps
```

## Stop the containers

Stops and removes the containers. Data is kept in the `mysql_data` volume:

```bash
docker-compose down
```

## Stop