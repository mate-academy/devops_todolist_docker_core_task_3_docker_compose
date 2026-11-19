# Django Todolist — Docker Compose

This project uses Docker Compose to run a Django Todolist application with a MySQL database.

## 1. Prerequisites

Before starting, make sure the following tools are installed:

- Docker Desktop
- Docker Compose
- Git

Make sure Docker Desktop is running.

## 2. Clone the Repository

Clone the project from GitHub:

```bash
git clone https://github.com/h3ronwaterr/devops_todolist_docker_core_task_3_docker_compose.git
```
Open the cloned project folder in VS Code and run the following commands from the integrated terminal.

## 3. Build and Start the Application

Build the Docker images and start both Django and MySQL services:

```bash
docker compose up -d --build
```

## 4. Verify the Application

Check the status of the containers:

```bash
docker compose ps
```

Check the application logs:

```bash
docker compose logs
```

Open the application in your browser:

`http://localhost:8081`

## 5. Stop the Application

Stop and remove the containers and project networks:

```bash
docker compose down
```

## 6. Data Persistence

The MySQL database uses a named Docker volume to store application data.

The volume preserves users and todo lists when containers are stopped and removed normally.

```bash
docker volume list
```

**Note:** Removing the database volume will delete its stored data. Avoid volume-removal commands unless you intentionally want to reset the database.