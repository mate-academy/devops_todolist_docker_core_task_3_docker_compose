# Project Deployment Instruction

This document describes how to manage the Todolist application and MySQL database containers using Docker Compose.

---

## Prerequisites
* Docker and Docker Compose installed and running.
* Correctly configured `.env` or `settings.py` (database host must be set to `mysql`).

---

## How to Run Containers

To build images and start all services in the background (detached mode), execute the following command from the project root directory:

```bash
docker compose up -d --build

docker compose down # To stop and remove all running containers while keeping your data safe.

#All Todo data is stored securely inside the MySQL database.

#Data persistence is handled via a named Docker volume (db-data) mapped to /var/lib/mysql inside the container.

#Stopping the containers with docker compose down will not delete your data. Your tasks will persist across restarts.

