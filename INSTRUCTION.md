# INSTRUCTION.md

## Django-Todolist with Docker

This document explains how to run and stop the Django-Todolist application using Docker and Docker Compose. The setup includes a MySQL database with persistent storage.

---

## Prerequisites

* Docker (version >= 20.10 recommended)
* Docker Compose (version >= 1.29 recommended)
* Python >= 3.8 (for local development if needed)

---

## Steps to Run

1. **Clone the repository**

   ```bash
   git clone git@github.com:kenu21/devops_todolist_docker_core_task_3_docker_compose.git
   ```

2. **Build and start the containers**

   ```bash
   docker-compose up --build
   ```

   This will:

   * Build the MySQL database container (`mysql-container`)
   * Build the Django-Todolist app container (`todoapp-container`)
   * Start both containers on the same network

3. **Verify containers are running**

   ```bash
   docker ps
   ```

   You should see two containers:

   * `mysql-container` (MySQL database)
   * `todoapp-container` (Django app)

---

## Database Details

* MySQL port on host: `3307`
* Database name: `app_db`
* User: `app_user`
* Password: `1234`
* Root password: `1234`

Persistent data is stored in a Docker volume named `db-data` to ensure your todos are not lost if containers are restarted.

---

## Access the Application

* Open your browser and go to: [http://localhost:8000](http://localhost:8000)

---

## Running Database Migrations and Starting App

The `ENTRYPOINT` in your Dockerfile for the app should automatically run migrations before starting the server:

```bash
sh -c "python manage.py migrate && python manage.py runserver 0.0.0.0:8080"
```

This ensures the database schema is created before the application starts.

---

## Stopping the Application

To stop the containers:

```bash
docker-compose down
```

This will stop and remove the containers, but the database data remains in the `db-data` volume.

---

## Rebuilding Containers

If you make changes to your Dockerfile or code:

```bash
docker-compose up --build
```

This rebuilds the images and starts the application with the latest changes.

---

## Notes

* Make sure MySQL container is healthy before the app container starts.
* The application port `8080` inside container is mapped to `8000` on host.
