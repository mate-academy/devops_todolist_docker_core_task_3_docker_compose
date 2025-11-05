# Docker Compose Instructions

This document provides instructions for running and stopping the Todolist application with MySQL database using Docker Compose.

## Prerequisites

- Docker installed on your system
- Docker Compose installed (version 3.8 or higher)

## Running the Application

### Start all services

To build and start both MySQL database and Todolist application:

```bash
docker-compose up
```

This command will:
- Build the Django application image
- Pull the MySQL image (if not already available)
- Create a network for service communication
- Create a persistent volume for MySQL data
- Start both services

### Start services in detached mode

To run containers in the background:

```bash
docker-compose up -d
```

### View logs

While containers are running, view logs:

```bash
docker-compose logs
```

To follow logs in real-time:

```bash
docker-compose logs -f
```

To view logs for a specific service:

```bash
docker-compose logs web
docker-compose logs db
```

## Accessing the Application

Once containers are running:
- **Todolist Application**: http://localhost:8080
- **MySQL Database**: localhost:3307 (exposed port, container uses 3306 internally)

## Stopping the Application

### Stop containers (preserve data)

To stop running containers without removing volumes:

```bash
docker-compose stop
```

This preserves the MySQL data volume.

### Stop and remove containers

To stop and remove containers (but keep volumes and networks):

```bash
docker-compose down
```

### Stop and remove everything including volumes

To stop containers, remove volumes, and clean up:

```bash
docker-compose down -v
```

**Warning**: This will delete all MySQL data stored in the persistent volume.

## Rebuilding the Application

If you make changes to the Dockerfile or application code:

```bash
docker-compose up --build
```

Or rebuild without starting:

```bash
docker-compose build
```

## Useful Commands

### Check container status

```bash
docker-compose ps
```

### Execute commands in running container

```bash
docker-compose exec web python manage.py shell
docker-compose exec db mysql -u app_user -p1234 app_db
```

### Restart a specific service

```bash
docker-compose restart web
docker-compose restart db
```

## Database Persistence

The MySQL data is stored in a Docker volume named `mysql_data`. This volume persists across container restarts, ensuring your todos and other data are preserved when you stop and start containers.

To verify the volume exists:

```bash
docker volume ls | grep mysql_data
```

## Troubleshooting

### Database connection issues

If the application fails to connect to the database:
1. Ensure MySQL container is healthy: `docker-compose ps`
2. Check MySQL logs: `docker-compose logs db`
3. Wait for MySQL to be fully ready (healthcheck should pass)

### Port conflicts

If ports 8080 or 3307 are already in use, modify the port mappings in `docker-compose.yml`:

```yaml
ports:
  - "8081:8080"  # Change host port for web
  - "3308:3306"  # Change host port for MySQL
```

### Reset everything

To start fresh (removes all data):

```bash
docker-compose down -v
docker-compose up --build
```

