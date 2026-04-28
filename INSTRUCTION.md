# Todolist Application Deployment Guide

This guide provides instructions on how to build, run, and manage the Todolist application using Docker Compose.

## Prerequisites
* Docker installed
* Docker Compose installed (V2 recommended)

## Project Structure
* `pythonapp`: Django application with automated migrations.
* `mysql`: Database service with persistent storage.

---

## 1. How to Start the Containers

To build the images and start all services in the background, run the following command in the root directory:

```Bash
docker-compose up -d
```

-d: Runs containers in "detached" mode (in the background).

Note: On the first run, the application will automatically execute database migrations via the ENTRYPOINT.

## 2. How to Verify the Application.
Once the containers are running, you can access the application at:
http://localhost:8080

To check the logs and ensure migrations were successful:

```Bash
docker-compose logs
```

## 3. How to Stop the Containers.
To stop and remove the containers while keeping the data safe in the volume:

```Bash
docker-compose stop
```

Or, to remove containers and the network:

```Bash
docker-compose down
```
## 4. Data Persistence.
All your Todos are stored in a Docker volume named db-data. This means even if you delete the containers, your data will persist and be available the next time you run docker compose up.