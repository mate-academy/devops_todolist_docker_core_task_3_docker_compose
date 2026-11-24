## Made from terminal
Bash
cat << 'EOF' > INSTRUCTION.md
# Django-Todolist — docker compose Instructions

This document describes how to build, run, monitor, and stop the **Django-Todolist** web application and **MySQL** database using Docker Compose.

## Prerequisites
- [Docker](https://docs.docker.com/get-docker/) and [docker compose](https://docs.docker.com/compose/) installed and running.
- Repository cloned locally:
    bash
  git clone git@github.com:Geo-DevO/devops_todolist_docker_core_task_3_docker_compose.git
  cd devops_todolist_docker_core_task_3_docker_compose

## Build and Start Services
Build images (if needed) and start both the MySQL database (db) and Django application (web) in the foreground (view live output):

Bash
docker compose up --build

## Or start the services in detached mode (in the background):

Bash
docker compose up -d --build

## To start already built images in the background without rebuilding:

Bash
docker compose up -d

## On startup, the application container waits for MySQL to become healthy, runs database migrations (python manage.py migrate), and starts the Django development server. Database data is stored in a persistent Docker volume so todos remain intact across container restarts.

## Access the Application
Once the containers are running, open your browser and go to:

Application UI: http://localhost:8000
API endpoint: http://localhost:8000/api/

## Check Status and Logs
Check the status and port mappings of running containers:

Bash
docker compose ps

## Stream logs from all services (db and web):

Bash
docker compose logs -f

## View logs for a specific service only (for example, web or db):

Bash
docker compose logs -f web
docker compose logs -f db

## Stop Containers and Manage Volumes
Stop and remove containers and the default network while preserving the MySQL data volume:

Bash
docker compose down

Stop and remove containers, network, and delete named volumes (clears all persisted MySQL database data):

Bash
docker compose down -v