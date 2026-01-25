# Docker Compose Instructions

This project runs a Django application with a MySQL database using Docker Compose.

The database data is stored in a persistent Docker volume, so todos will not be lost after restarting containers.

---

## Requirements

- Docker
- Docker Compose

---

## Build and start the application

Run the following command in the project root directory:

```bash
docker compose up --build
```
To run in detached mode:
```bash
docker compose up --build -d
```

---

## Open the application
After successful startup, open in your browser:
http://localhost:8000

---
## Additional commands

### Stop containers
```bash
docker compose down
```

### Stop containers and delete database data
⚠️ This will remove all todos stored in the database.
```bash
docker compose down -v
```

### View logs
```bash
docker compose logs -f
```

---

## Notes
* MySQL data is stored in a persistent Docker volume.
* Database migrations are executed automatically when the application container starts.