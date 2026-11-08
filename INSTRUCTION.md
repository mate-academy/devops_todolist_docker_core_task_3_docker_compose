# Docker Compose Instructions

## 1. Prerequisites

Before starting the application, make sure you have installed:

- Docker Engine or Docker Desktop.
- Docker Compose (included in modern Docker Desktop installations).

Verify the installations:

```bash
docker --version
docker compose version
```

## 2. Navigate to the Project Directory

Open a terminal and navigate to the directory containing the `docker-compose.yml` file.

```bash
cd /path/to/project
```

Make sure the Compose configuration file is present:

```bash
ls
```

## 3. Build and Start Containers

Build the Docker images and start the application containers in detached mode:

```bash
docker compose up -d
```

Explanation:

- `up` creates and starts the containers.
- `-d` runs containers in the background.

## 4. Verify Running Containers

Check the status of the containers:

```bash
docker compose ps
```

To display all containers, including stopped ones:

```bash
docker compose ps -a
```

## 5. View Container Logs

Display logs from all services:

```bash
docker compose logs
```

Follow logs in real time:

```bash
docker compose logs -f
```

Display logs for a specific service:

```bash
docker compose logs -f pythonapp
```

```bash
docker compose logs -f mysql
```

Press `Ctrl+C` to stop following the logs. This does not stop the containers.

## 6. Access the Application

Once the containers are running, access the application through your browser:

```text
http://localhost:8080
```

The MySQL service is exposed on port `3306`.

## 7. Stop Containers

To stop all containers without removing them:

```bash
docker compose stop
```

The containers remain available and can be started again using:

```bash
docker compose start
```

To stop and remove the containers and the default Compose network:

```bash
docker compose down
```

**Note:** Named volumes are preserved when using `docker compose down`. This means MySQL database data remains available when the containers are recreated.

## 8. Remove Containers and Persistent Data

If you want to remove containers, networks, and named volumes:

```bash
docker compose down -v
```

**Warning:** The `-v` flag removes the named volumes declared in the Compose configuration. This permanently deletes the persisted MySQL data stored in those volumes.

Use this command only when you intentionally want to reset the database.

## 9. Useful Docker Compose Commands

| Command | Description |
|---|---|
| `docker compose up -d` | Start services in detached mode |
| `docker compose stop` | Stop running containers |
| `docker compose start` | Start existing stopped containers |
| `docker compose restart` | Restart services |
| `docker compose ps` | Display service status |
| `docker compose logs` | Display service logs |
| `docker compose logs -f` | Follow logs in real time |
| `docker compose down` | Stop and remove containers and networks |
| `docker compose down -v` | Remove containers, networks, and named volumes |

## 10. Recommended Workflow

For normal development:

1. Navigate to the project directory.
2. Run `docker compose up -d --build`.
3. Verify containers using `docker compose ps`.
4. Check logs if necessary using `docker compose logs -f`.
5. Access the application at `http://localhost:8080`.
6. When finished, run `docker compose down`.

This workflow allows you to manage the application and its database through a single Docker Compose configuration.