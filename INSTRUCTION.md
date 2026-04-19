# Instructions: Running Django Todolist with Docker Compose

## Prerequisites

Make sure you have the following installed on your machine:
- [Docker](https://docs.docker.com/get-docker/) (version 20.10+)
- [Docker Compose](https://docs.docker.com/compose/install/) (version 2.0+)

Verify your installations:
```bash
docker --version
docker compose version
```

---

## Project Structure

```
.
├── Dockerfile            # Django app image
├── dockerfile.mysql      # MySQL image
├── docker-compose.yml    # Orchestrates both services
├── requirements.txt
├── manage.py
└── INSTRUCTION.md
```

---

## Running the Application

### 1. Clone the repository

```bash
git clone <your-repo-url>
cd <repo-folder>
```

### 2. Build and start all containers

```bash
docker compose up --build
```

- `--build` forces Docker to rebuild images (use it on first run or after code changes).
- This command will:
  1. Build the MySQL image and start the `db` container
  2. Build the Django image and start the `app` container
  3. Automatically run `python manage.py migrate` before starting the server

### 3. Run in detached (background) mode

```bash
docker compose up --build -d
```

### 4. Access the application

| Service   | URL                          |
|-----------|------------------------------|
| App UI    | http://localhost:8080        |
| API       | http://localhost:8080/api/   |
| MySQL     | localhost:3306               |

---

## Stopping the Application

### Stop containers (keep data)

```bash
docker compose down
```

This stops and removes the containers but **preserves** the `mysql_data` volume (your todos are safe).

### Stop containers and remove all data

```bash
docker compose down -v
```

> ⚠️ This also deletes the persistent volume — all stored todos will be lost.

---

## Useful Commands

### View running containers
```bash
docker compose ps
```

### View application logs
```bash
docker compose logs app
```

### View MySQL logs
```bash
docker compose logs db
```

### Follow logs in real time
```bash
docker compose logs -f
```

### Restart a specific service
```bash
docker compose restart app
```

### Open a shell inside the Django container
```bash
docker compose exec app bash
```

### Open a MySQL shell
```bash
docker compose exec db mysql -u app_user -p1234 app_db
```

---

## Troubleshooting

**App fails to start with a database connection error?**  
The `app` service waits for MySQL to be healthy before starting, but Django's first request might still catch the DB warming up. Simply wait a few seconds and refresh.

**Port 8080 or 3306 already in use?**  
Change the host port in `docker-compose.yml`:
```yaml
ports:
  - "8081:8080"   # change left side only
```

**Want to rebuild from scratch?**
```bash
docker compose down -v
docker compose up --build
```