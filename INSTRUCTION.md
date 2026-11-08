# Running Todolist with Docker Compose

This project runs two containers, both defined in `docker-compose.yml`:

| Service | Container name | Built from         | Purpose                         | Port                  |
|---------|----------------|--------------------|---------------------------------|-----------------------|
| `db`    | `todolist-db`  | `Dockerfile.mysql` | MySQL database that stores todos | 3306 (internal only)  |
| `app`   | `todolist-app` | `Dockerfile`       | Django Todolist web application | 8080 → `localhost:8080` |

MySQL data is kept in the named volume `mysql_data`, so todos survive container restarts and re-creation.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) with the Compose plugin (Docker Desktop includes both).
- Check that they work:

  ```bash
  docker --version
  docker compose version
  ```

> Older installations use `docker-compose` (with a dash) instead of `docker compose`. The commands below work with either.

## 1. Clone the repository

```bash
git clone https://github.com/MishaLehotskyi/devops_todolist_docker_core_task_3_docker_compose.git
cd devops_todolist_docker_core_task_3_docker_compose
```

## 2. Build and start the containers

```bash
docker compose up --build
```

- `--build` (re)builds both images before starting.
- Compose first starts `db` and waits until its healthcheck (`mysqladmin ping`) passes.
- Then it starts `app`. On start, the app runs `python manage.py migrate` (which creates the tables in MySQL) and then `python manage.py runserver 0.0.0.0:8080`.

To run in the background (detached mode) instead:

```bash
docker compose up --build -d
```

## 3. Open the application

- Landing page: http://localhost:8080/
- API: http://localhost:8080/api/

Register a user, log in and create some todo lists and todos.

## 4. Check status and logs

```bash
docker compose ps              # list containers and their state/health
docker compose logs -f         # follow logs of all services (Ctrl+C to exit)
docker compose logs -f app     # logs of the Django app only
docker compose logs -f db      # logs of MySQL only
```

## 5. Stop the containers

```bash
# Stop containers but keep them (start again later with `docker compose start`)
docker compose stop

# Stop and remove containers and the network (the data volume is KEPT)
docker compose down
```

If you started in the foreground (without `-d`), press `Ctrl+C` to stop, then run `docker compose down`.

## 6. Data persistence

Todos are stored in MySQL, and MySQL keeps its files in the named volume `mysql_data` (mounted at `/var/lib/mysql`).

```bash
docker volume ls                # Compose prefixes the volume with the project folder name
docker compose down             # containers removed, volume kept
docker compose up -d            # your todos are still there
```

To delete **everything, including all stored data**:

```bash
docker compose down -v
```

## 7. Useful extra commands

```bash
docker compose restart app                                   # restart only the app
docker compose exec app python manage.py createsuperuser     # create an admin user (http://localhost:8080/admin/)
docker compose exec db mysql -u app_user -p1234 app_db       # open a MySQL shell
```

## Troubleshooting

- **Port 8080 already in use**: stop whatever uses it, or change the mapping in `docker-compose.yml` to e.g. `"8081:8080"` and open http://localhost:8081.
- **App fails to connect to the database**: check `docker compose logs db`. The app only starts after `db` is healthy, but a broken volume from an older MySQL version can stop MySQL from starting. In that case run `docker compose down -v` (this deletes the data) and start again.
