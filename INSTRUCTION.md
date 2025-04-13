# INSTRUCTION.md

## 🐳 Docker Compose Instructions

### 🚀 How to Run the Application

1. Make sure Docker is running on your system.
2. Navigate to the project directory in terminal:

```bash
cd path/to/devops_todolist_docker_core_task_3_docker_compose
```

3. Run the application:

```bash
docker-compose up --build
```

- This will build both the MySQL and Django containers and start them.
- The application will be available at: [http://localhost:8080](http://localhost:8080)

### 📆 Persistent Volume

- The MySQL database uses a named Docker volume (`db-data`) to persist todos even if containers are stopped or removed.
- You can verify the volume with:

```bash
docker volume ls
```

### 🚩 How to Stop the Containers

```bash
docker-compose down
```

- This will stop and remove the containers.
- Data in the MySQL volume (`db-data`) will remain.
- To remove everything including volumes:

```bash
docker-compose down -v
```

### ✅ Status Check

Check running containers:

```bash
docker-compose ps
```

View logs:

```bash
docker-compose logs
```


