# Docker Compose Instructions

## Prerequisites
- Docker installed on your system
- Docker Compose installed on your system

## Running the Application

### Start containers
To build and start all containers in the foreground:
```bash
docker-compose up --build
```

To run containers in detached mode (background):
```bash
docker-compose up --build -d
```

### Access the application
Once the containers are running, you can access:
- Landing page: http://localhost:8080/
- API: http://localhost:8080/api/

## Stopping the Application

### Stop containers
To stop containers running in the foreground, press `Ctrl+C`.

To stop containers running in detached mode:
```bash
docker-compose down
```

### Stop and remove volumes
To stop containers and remove persistent data (MySQL database):
```bash
docker-compose down -v
```

## Useful Commands

### View logs
```bash
docker-compose logs
```

### View logs for a specific service
```bash
docker-compose logs todoapp
docker-compose logs mysql
```

### Restart services
```bash
docker-compose restart
```

### Check container status
```bash
docker-compose ps
```