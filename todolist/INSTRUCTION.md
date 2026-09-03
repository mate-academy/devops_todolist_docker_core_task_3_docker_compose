# Instruction: Running the Todolist App with Docker Compose

This project uses Docker Compose to build and run two services:

- **mysql** — MySQL database that stores the application's data, with a persistent volume so data survives container restarts/rebuilds.
- **todolist** — the Django Todolist application, which runs database migrations and starts the web server on container startup.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed and running
- Docker Compose v2 (bundled with Docker Desktop, invoked as `docker compose`)

## Project Structure (relevant files)


## 1. Build and Start the Containers

From the root of the project (where `docker-compose.yml` is located), run:

```bash
docker compose up --build -d
```

**What this does:**
- `--build` forces Docker to (re)build the images from the `Dockerfile` and `Dockerfile.mysql` before starting.
- `-d` runs the containers in detached mode (in the background).

On first startup, the `todolist` container will:
1. Wait for/connect to the MySQL database.
2. Run `python manage.py migrate` to apply database migrations.
3. Start the Django development server on port `8080`.

## 2. Verify the Containers Are Running

```bash
docker ps
```

You should see two containers up and running:
- `mysql-db` — MySQL, listening on port `3306`
- `todolist-app` — Django app, listening on port `8080`

## 3. Access the Application

Open your browser and go to:


## 1. Build and Start the Containers

From the root of the project (where `docker-compose.yml` is located), run:

```bash
docker compose up --build -d
```

**What this does:**
- `--build` forces Docker to (re)build the images from the `Dockerfile` and `Dockerfile.mysql` before starting.
- `-d` runs the containers in detached mode (in the background).

On first startup, the `todolist` container will:
1. Wait for/connect to the MySQL database.
2. Run `python manage.py migrate` to apply database migrations.
3. Start the Django development server on port `8080`.

## 2. Verify the Containers Are Running

```bash
docker ps
```

You should see two containers up and running:
- `mysql-db` — MySQL, listening on port `3306`
- `todolist-app` — Django app, listening on port `8080`

## 3. Access the Application

Open your browser and go to:


## 4. View Logs

To check the logs of a specific service (useful for debugging):

```bash
docker logs -f todolist-app
docker logs -f mysql-db
```

Or view logs for all services at once via Compose:

```bash
docker compose logs -f
```

## 5. Stop the Containers

To stop the running containers **without** removing them (so their state/volumes remain intact for a quick restart):

```bash
docker compose stop
```

To start them again later:

```bash
docker compose start
```

## 6. Stop and Remove the Containers

To stop and remove the containers, along with the network created by Compose:

```bash
docker compose down
```

⚠️ **Note:** this command does **not** delete the named volume (`db-data`) by default, so your MySQL data will persist for the next `docker compose up`.

### Remove Containers *and* the Database Volume

If you want a completely clean slate (this will **permanently delete all data** stored in MySQL):

```bash
docker compose down -v
```

## 7. Rebuilding After Code Changes

If you make changes to the application code or Dockerfiles, rebuild the images and restart the containers:

```bash
docker compose up --build -d
```

## Data Persistence

MySQL data is stored in a named Docker volume (`db-data`), mapped to `/var/lib/mysql` inside the `mysql` container. This means:

- Your todos and other data will **persist** across `docker compose down` / `docker compose up` cycles.
- Data is only lost if you explicitly run `docker compose down -v` or manually delete the volume with `docker volume rm`.

## Troubleshooting

| Problem | Possible Cause | Solution |
|---|---|---|
| `ERR_CONNECTION_RESET` on `localhost:8080` | App failed to start (e.g., DB connection error) | Check `docker logs todolist-app` |
| `django.db.utils.DatabaseError: Can't connect to MySQL server` | App is trying to reach the DB by the wrong host | Ensure `DB_HOST` in the app's settings/environment is set to `mysql` (the service name), not `localhost` or a hardcoded IP |
| `no configuration file provided: not found` | Wrong filename or wrong directory | Make sure you are in the folder containing `docker-compose.yml`, or the modern `docker compose` command is used instead of the older `docker-compose` |
| Containers exit immediately | Migration or startup error | Run `docker logs <container_name>` to see the traceback |