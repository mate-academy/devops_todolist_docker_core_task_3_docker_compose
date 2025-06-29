# Django Todo Application - Docker Compose Setup

## Quick Start

### 1. Start the Application

```bash
docker-compose up --build
```

This command will:

- Build MySQL container from `Dockerfile.mysql`
- Build Django application container from `Dockerfile`
- Create persistent volume for MySQL data
- Start both containers with network connectivity
- Run database migrations automatically
- Start the Django development server

### 2. Access the Application

Open your browser and go to:

```
http://localhost:8080
```

Available endpoints:

- Main app: `http://localhost:8080/`
- API: `http://localhost:8080/api/`
- Admin: `http://localhost:8080/admin/`

## Management Commands

### Start Services

```bash
# Start in foreground (see logs)
docker-compose up

# Start in background
docker-compose up -d

# Start with rebuild
docker-compose up --build
```

### Stop Services

```bash
# Stop all containers
docker-compose down

# Stop and remove volumes (deletes all data!)
docker-compose down -v
```

### View Logs

```bash
# All services
docker-compose logs

# Specific service
docker-compose logs todoapp
docker-compose logs mysql

# Follow logs
docker-compose logs -f
```

### Service Status

```bash
# Check running containers
docker-compose ps

# Restart service
docker-compose restart todoapp
```

## What's Included

- **MySQL 8.0** database with persistent storage
- **Django Todo App** with automatic migrations
- **Volume**: `db-data` for persistent MySQL data
- **Network**: `db-data-net` for container communication
- **Ports**: 3306 (MySQL), 8080 (Django)

## Data Persistence

Your todos are stored in MySQL database with persistent volume. Data survives container restarts and updates.

## Troubleshooting

**Port conflicts:** Change ports in `docker-compose.yml` if needed

**Database issues:** Check logs with `docker-compose logs mysql`

**App won't start:** Ensure MySQL is fully initialized before Django starts
