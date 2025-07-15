# Django Todolist Docker Instructions

## Prerequisites
- Docker and Docker Compose installed

## Running the Application

Build and start services:
```bash
docker compose up --build
```

Run in background:
```bash
docker compose up -d
```

## Accessing the Application
- Web Application: http://localhost:8080
- API: http://localhost:8080/api/

## Stopping the Application

Stop services:
```bash
docker compose down
```

Stop and remove data:
```bash
docker compose down -v
```

## Useful Commands

View logs:
```bash
docker compose logs
```

Restart services:
```bash
docker compose restart
```
