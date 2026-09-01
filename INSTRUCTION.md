# Instructions for Running Django-Todolist with Docker Compose

This guide provides instructions on how to build, run, inspect, and stop the Django Todolist application along with the MySQL database using Docker Compose.

---

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed on your machine.
- [Docker Compose](https://docs.docker.com/compose/install/) (included with Docker Desktop / Docker CLI plugins).

---

## 1. Build and Start Containers

### Start in Foreground (view logs directly in terminal)
Build the images and start all services:
```bash
docker compose up --build
```
> **Note:** On first startup, the application container will wait for the MySQL container to initialize and apply migrations before starting the Django server.

### Start in Background (Detached Mode)
To run containers in the background:
```bash
docker compose up -d --build
```

---

## 2. Access the Application

Once the containers are running:
- **Web App Landing Page:** [http://localhost:8080/](http://localhost:8080/)
- **API Endpoint:** [http://localhost:8080/api/](http://localhost:8080/api/)

---

## 3. Check Status and Logs

### Check Running Containers
```bash
docker compose ps
```

### View Logs
- Follow logs from all services:
  ```bash
  docker compose logs -f
  ```
- View logs for a specific service:
  ```bash
  docker compose logs -f pythonapp
  docker compose logs -f mysql
  ```

---

## 4. Stopping Containers

### Stop Containers (Keep Resources Intact)
To temporarily stop running containers without removing them:
```bash
docker compose stop
```

### Stop and Remove Containers & Networks
To stop and remove containers, networks, and images created by `up`:
```bash
docker compose down
```

### Stop and Reset Database (Remove Volumes)
To stop containers and also delete the persistent MySQL volume (resets all database data):
```bash
docker compose down -v
```

---

## 5. Data Persistence

The MySQL service uses a named Docker volume (`todolist-data`) mounted to `/var/lib/mysql`. All created lists and tasks remain persistent across container restarts (`docker compose down` and `docker compose up`).
