

# INSTRUCTION.md

## Prerequisites

Before running the project, make sure you have installed:

- **Docker Desktop** - for working with containers
  - [Download Docker Desktop](https://www.docker.com/products/docker-desktop/)
  - After installation, start Docker Desktop
- **Git** - for cloning the repository
  - [Download Git](https://git-scm.com/downloads)
- **Python** (optional) - for local development

## How to run the project

### 1. Clone the project from GitHub
```bash
git clone https://github.com/DemqN96/devops_todolist_docker_core_task_3_docker_compose
cd devops_todolist_docker_core_task_3_docker_compose
```
**What this does:** Downloads the project code to your computer

### 2. Configuration (optional)
The `docker-compose.yml` file is already configured and ready to use. 
If you want to customize it, you can edit environment variables in this file.

### 3. Start the project
```bash
docker compose up --build -d
```
**What this does:** 
- `--build` - rebuilds container images
- `-d` - runs containers in background mode
- Creates and starts all necessary services (Django app, database)

### 4. Check if it's working
```bash
docker compose ps
```
**What this shows:** Status of all running containers

```bash
docker compose logs -f app
```
**What this shows:** Django app logs in real-time (Ctrl+C to exit)

**Access to the application:**
- Web interface: http://localhost:8080/
- API: http://localhost:8080/api/

### 5. Stop the project
```bash
docker compose down
```
**What this does:** Stops all containers but preserves data

```bash
docker compose down -v
```
**What this does:** Stops containers and removes all data (database will be cleared)

### 6. Start again if needed
```bash
docker compose up --build -d
```

## Troubleshooting

### Problem: "docker: command not found"
**Solution:** Install Docker Desktop and restart your terminal

### Problem: "Port 8080 is already in use"
**Solution:** 
```bash
# Check what's using port 8080
lsof -i :8080
# Or change the port in docker-compose.yml
```

### Problem: Containers won't start
**Solution:**
```bash
# Check logs
docker compose logs

# Rebuild from scratch
docker compose down -v
docker compose up --build
```

### Problem: Database connection issues
**Solution:**
```bash
# Restart with data cleanup
docker compose down -v
docker compose up --build -d
```

## Useful commands

```bash
# View all containers
docker ps

# View logs for specific service
docker compose logs [service_name]

# Enter container for debugging
docker compose exec app bash

# Restart single service
docker compose restart [service_name]
```

***

[1](https://github.com/DemqN96/devops_todolist_docker_core_task_3_docker_compose)
