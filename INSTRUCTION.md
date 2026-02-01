**Docker** and **Docker Compose** must be installed on your machine.

# Run the container

```bash
docker-compose up -d --build
```

# Access the App
**http://localhost:8080**

# Data

The Todo data is stored in a databese.
The Docker volume `db_data` is used to not losing the data after containers stop

- **Volume Name:** `db_data`
- **Mount Path:** `/var/lib/mysql` (inside the DB container)

## Stop the App

stop and remove  containers & networks:

```bash
docker-compose down
```

# Logs

```bash
docker-compose logs -f app
```

```bash
docker-compose logs -f db
```
