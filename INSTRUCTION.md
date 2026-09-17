# Docker Compose Instructions

## Start

Build and start the containers in detached mode:

```bash
docker compose up -d --build
```

Open the application at:

```text
http://localhost:8080
```

## Stop

Stop the running containers:

```bash
docker compose stop
```

## Stop and Remove

Stop and remove the containers and network:

```bash
docker compose down
```

The MySQL data remains stored in the Docker volume.
