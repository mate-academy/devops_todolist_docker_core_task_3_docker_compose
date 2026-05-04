# Instructions

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed
- [Docker Compose](https://docs.docker.com/compose/install/) installed

## Run

```bash
docker-compose up
```

To run in background:

```bash
docker-compose up -d
```

The application will be available at [http://localhost:8080](http://localhost:8080)

## Stop

```bash
docker-compose down
```

To stop and remove volumes (deletes all data):

```bash
docker-compose down -v
```
