# Todo app + MySQL with Docker Compose

## Prerequisites

- Docker Desktop (or Docker Engine) with the Compose plugin.
- Run these commands from the project directory containing `docker-compose.yml`,
  `Dockerfile`, `Dockerfile.mysql`, `requirements.txt`, and `manage.py`.

## Configuration

The Compose file starts two services:

- `db`: MySQL 8.0, database `app_db`, user `app_user`.
- `app`: Django Todo app, exposed at `http://localhost:8080`.

MySQL data is stored in the named volume `mysql_data`, so database contents
survive container recreation and ordinary `docker compose down`.

Ensure `requirements.txt` contains the MySQL connector expected by the project,
for example `mysql-connector-python==8.2.0`.

In `todolist/settings.py`, configure Django to use the Compose service name
`db` as the hostname (not `localhost`, which would refer to the app container):

```python
DATABASES = {
    "default": {
        "ENGINE": "mysql.connector.django",
        "NAME": os.getenv("DB_NAME", "app_db"),
        "USER": os.getenv("DB_USER", "app_user"),
        "PASSWORD": os.getenv("DB_PASSWORD", "1234"),
        "HOST": os.getenv("DB_HOST", "db"),
        "PORT": os.getenv("DB_PORT", "3306"),
    }
}
```

Make sure `import os` is present in `settings.py`. If the project uses a different
MySQL Django backend, retain the backend compatible with its installed connector.

## Build and start

```bash
docker compose up --build
```

Compose waits for the MySQL health check before starting the app. The app
entrypoint then runs `python manage.py migrate`; only if migrations succeed
does it start Django on `0.0.0.0:8080`.

Open <http://localhost:8080> in your browser.

To start in the background:

```bash
docker compose up --build -d
```

## Check status and logs

```bash
docker compose ps
docker compose logs -f
docker compose logs -f db
docker compose logs -f app
```

Stop following logs with `Ctrl+C`; this does not stop the containers.

## Stop and restart

Stop and remove the containers and Compose network:

```bash
docker compose down
```

Start again:

```bash
docker compose up -d
```

The `mysql_data` volume is retained by `docker compose down`, so saved todos
remain in MySQL.

## Stop and delete the database volume (destructive)

Only if you intentionally want to erase the saved database and all todos:

```bash
docker compose down -v
```

The `-v` option deletes the named volume and its data. Do not use it if you want
to keep your todos.

## Troubleshooting

- If the app exits, inspect `docker compose logs app` and `docker compose logs db`.
- If MySQL is still initializing, Compose health checks should delay app startup.
- If the database settings use `localhost`, change the host to `db`.
- If port `8080` is already in use, change the left side of the port mapping, e.g.
  `8081:8080`, then open <http://localhost:8081>.
- If you changed MySQL initialization credentials after the volume was already
  created, those variables do not rewrite the existing database users. For a
  fresh disposable development database only, `docker compose down -v` resets it.

## Pull request checklist

1. Check `git status` and review the changes.
2. Run `docker compose config` to validate the Compose file.
3. Run `docker compose up --build` and verify the Todo page loads.
4. Create a branch, commit the changes, push it to your GitHub fork, and open a
   Pull Request against the course repository.
5. Include the PR URL in the course platform submission.
