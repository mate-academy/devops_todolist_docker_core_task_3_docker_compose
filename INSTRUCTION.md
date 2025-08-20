# Instructions for running Todolist with Docker Compose

## 1. Setup

Copy `.env.example` to `.env` and adjust values if needed:

```bash
cp .env.example .env
```

## 2. Build and start project

```bash
docker-compose up --build
```

The app will be available at:  
👉 http://localhost:8000

## 3. Stop project

```bash
docker-compose down
```

## 4. Persistent data

MySQL data is stored in the named volume `db_data`.

To check volumes:

```bash
docker volume ls
docker volume inspect devops_todolist_docker_core_task_3_docker_compose_db_data
```

> Replace `devops_todolist_docker_core_task_3_docker_compose_db_data` with your actual volume name if your project folder is named differently.