## Run with Docker Compose

### Prerequisites
- Installed Docker Desktop (with Compose)
- Docker engine running

### Start (build + run)
From the repository root:

```bash
docker compose up --build
```

App will be available on `http://localhost:8080/`  
API will be available on `http://localhost:8080/api/`

Notes:
- On the first start, the `web` container will run Django migrations automatically.
- MySQL data is persisted in a named volume `mysql_data`.

### Run in background

```bash
docker compose up -d --build
```

### Check status / logs

```bash
docker compose ps
docker compose logs -f
docker compose logs -f web
docker compose logs -f db
```

### Stop containers (keep DB data)

```bash
docker compose down
```

### Stop containers and remove DB data (DANGER)

```bash
docker compose down -v
```

### Rebuild images

```bash
docker compose build --no-cache
```

