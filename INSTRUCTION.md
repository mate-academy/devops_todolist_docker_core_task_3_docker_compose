# INSTRUCTION

## Start

**Bring up the whole stack with a single command:**

```bash
docker-compose up -d --build
```

The `-d` flag runs the containers in detached mode (frees the terminal). The `--build` flag rebuilds the images from the Dockerfiles to pick up the latest changes.

## Stop

**To stop the whole stack, use:**

```bash
docker-compose down
```

This command stops all containers and also removes the containers and the network. Adding the `-v` flag will additionally remove the volumes.

> **Important:** use the `-v` flag only when you are sure the data stored in the volume is no longer needed.

## Logs / status

To view the logs:

```bash
docker-compose logs
```

This shows the logs from all containers.

```bash
docker-compose logs <container_name>
```

This shows the logs of a specific container.

To check the status of the containers:

```bash
docker-compose ps
```

## Access via browser

Once the stack is running, open the application at:

```
http://localhost:8080
```

## Data persistence

MySQL data is stored in the named volume `db-data`, so it survives `docker-compose down` and persists between restarts. The data is removed only when you run `docker-compose down -v`.