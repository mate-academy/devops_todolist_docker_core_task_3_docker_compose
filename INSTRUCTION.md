# Docker Compose Instructions

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed
- [Docker Compose](https://docs.docker.com/compose/install/) installed (included with Docker Desktop)

## Running the Application

Build and start all containers in detached mode:

```bash
docker-compose up --build -d
```

To view logs while running:

```bash
docker-compose logs -f
```

Once started, the application is available at: http://localhost:8080

## Stopping the Application

Stop and remove containers (data volume is preserved):

```bash
docker-compose down
```

To also remove the persistent MySQL volume (all data will be lost):

```bash
docker-compose down -v
```

## Notes

- The `db` service (MySQL) must be healthy before the `app` service starts. The `depends_on` healthcheck handles this automatically.
- Todo data is stored in the `mysql_data` Docker volume and persists across container restarts.
- To rebuild images after code changes, run `docker-compose up --build`.
