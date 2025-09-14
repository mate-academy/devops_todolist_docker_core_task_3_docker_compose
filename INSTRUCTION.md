# INSTRUCTION.md

## Overview
This project runs a **Todolist application** with a **MySQL database** using Docker Compose. 

---

## Prerequisite
- [Docker](https://docs.docker.com/get-docker/) installed
- [Docker Compose](https://docs.docker.com/compose/install/) installed
- [Python 3.8 or higher](https://www.python.org/downloads/) installed

---

## How to Run

### 1. Clone the repository
```
git clone https://github.com/r-marianna/devops_todolist_docker_core_task_3_docker_compose.git
cd devops_todolist_docker_core_task_3_docker_compose
```

### 2. Build and start containers
```
docker-compose up -d --build
```
### 3. Verify containers are running
```
docker ps
```
You should see at least two containers:
- `todolist`
- `mysql`
To follow the app logs: 
```
docker-compose logs -f todolist
docker-compose logs -f mysql_db
```

### 4. Access the application
Open in browser:
http://localhost:8000

---

## How to Stop
### Stop running containers (without removing data)
```
docker-compose down
```

### To remove volumes and data  
```
docker-compose down --volumes
```