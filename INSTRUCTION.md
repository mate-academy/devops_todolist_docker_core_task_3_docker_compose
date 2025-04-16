# Dockerized Todolist App + MySQL

Project, that shows launching Python Django with MySQL database with help of Docker Compose

---

## Requirements:

- Docker
- Docker Compose

---

## Launching the Project

1. **Clone the repo**

```bash
git clone https://github.com/yellowflashdanya/devops_todolist_docker_core_task_3_docker_compose.git
```

2. **Switch on Docker Compose**

```bash
docker-compose up --build
```

- That will build two images **MySQL** and **todoapp**
- Launch migration
- Launch Django server: http://localhost:8000

3. 🛑 **Stop the Project**

```bash
docker compose down
```

Or with deleting of Volumes

```bash
docker compose down -v
```

💾 Saving the data:
MySQL database stored in Docker Volume **mysql-data**, that you won't lose the todos after stoping/restart

🧪 Access to database:

- host: **localhost** or **mysql**
- port: **3306**
- user: **app_user**
- password: **1234**
- database: **app_db**

📌 Notes:
Don't forget to verify **settings.py**, that all the data used correctly
