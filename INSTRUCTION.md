## Overview

The project runs as two services defined in `docker-compose.yml`:

- **mysql**: MySQL database server (the application's only database).
- **pythonapp**: the Django application.

#### Database

The application uses **MySQL** as its database. The Django app connects to the `mysql` service over the internal Docker network, using the connection settings passed as environment variables in `docker-compose.yml`.

#### Port Configuration

The application inside the container listens on port 8080 (`0.0.0.0:8080`).
Docker Compose maps the host's port 8080 to the container's port 8080 (`8080:8080`).

#### Data Persistence

MySQL data is stored in a named Docker volume (`db-data`), mounted at `/var/lib/mysql` in the `mysql` container. The data is not tied to the container's lifecycle:

- `docker compose down` removes the containers but keeps the volume, so the database data survives.
- `docker compose down -v` removes the containers and the volume, which permanently deletes all database data.

#### Database Migrations

Migrations run at container start: the application container executes `python manage.py migrate` before starting the Django server, once MySQL is ready. Because the database lives in a persistent volume, only migrations that have not been applied yet are executed on later starts.

## Usage

To **build** the images and **start** the app in the background:

```bash
docker compose up -d --build
```

To **stop** and **remove** the containers (the database volume is kept):

```bash
docker compose down
```

To also **delete the database volume**:

```bash
docker compose down -v
```

To inspect Django output, migration logs, or runtime errors:

```bash
docker compose logs -f
```

To inspect container status:

```bash
docker compose ps
```

To access the application, open [localhost:8080](http://localhost:8080/) in a browser.
