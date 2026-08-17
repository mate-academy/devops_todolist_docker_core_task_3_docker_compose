# Django-Todolist — Docker Compose Instructions

## Prerequisites

- Docker installed
- Docker Compose installed (bundled with Docker Desktop, or `docker-compose` plugin)

## Running the Application

### 1. Start all services

```bash
docker-compose up --build
```

This will:
1. Build the Django app image
2. Start a MySQL container (with a persistent volume for data)
3. Wait for MySQL to be healthy
4. Run database migrations inside the app container
5. Start the Django development server on port 8080

### 2. Access the application

- **Web UI**: http://localhost:8080
- **API**: http://localhost:8080/api/
- **MySQL**: port 3306 (exposed for external tools)

### 3. Stop the application

```bash
# Press Ctrl+C to stop containers gracefully
# Or in another terminal:
docker-compose down
```

### 4. Stop and remove volumes (fresh start)

```bash
docker-compose down -v
```

> ⚠️ This deletes all data in the MySQL persistent volume.

## Stopping Containers Without Removing Them

```bash
docker-compose stop    # stops containers, keeps them
docker-compose start   # restarts stopped containers
```

## Useful Commands

| Command | Description |
|---------|-------------|
| `docker-compose up --build` | Build and start |
| `docker-compose up -d` | Start in detached mode |
| `docker-compose down` | Stop and remove containers/volumes |
| `docker-compose down -v` | Stop, remove containers + delete volumes |
| `docker-compose logs -f app` | Follow app logs |
| `docker-compose logs -f db` | Follow MySQL logs |
| `docker-compose ps` | Show running containers |

## Architecture

```
┌──────────────┐     ┌──────────────┐
│   App :8080  │────▶│   DB :3306   │
│  (Django)    │     │  (MySQL)     │
└──────────────┘     └──────────────┘
     persistent volume → mysql_data:/var/lib/mysql
```

## Database

- **Host**: `db` (Docker Compose service name)
- **Database**: `app_db`
- **User**: `app_user`
- **Password**: `1234`
- **Root password**: `1234`

Data persists in the `mysql_data` Docker volume across container restarts.
