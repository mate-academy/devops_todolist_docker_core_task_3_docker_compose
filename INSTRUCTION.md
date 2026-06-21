# Docker Core / Docker Compose | ToDo App. Part 3


## Run with Docker Compose

This project uses `docker-compose.yml` to build and start both the MySQL database and the ToDo application together, connected via a shared Docker network, with a persistent volume for the database.

### Start the application

From the project root (where `docker-compose.yml` is located), run:

```bash
docker-compose up --build -d
```

- `--build` forces Compose to (re)build the images from the `Dockerfile` and `Dockerfile.mysql` rather than reusing a possibly stale local image. Use this any time you've changed either Dockerfile.
- Omit `--build` on subsequent runs if neither Dockerfile has changed, to start faster using the previously built images.
- To run in the background (detached mode) add `-d`

### What happens on startup

- The `mysql` service builds from `Dockerfile.mysql` and starts a MySQL server, initializing the `app_db` database and `app_user` user automatically via environment variables.
- A named volume `mysql-data` is attached to `/var/lib/mysql`, so all ToDo data persists across container restarts and recreations.
- The `todoapp` service builds from the application `Dockerfile`, waits for the `mysql` service to start (via `depends_on`), then runs database migrations and starts the Django development server in one step (see `ENTRYPOINT` in the `Dockerfile`).
- Both services share the `todo-app-network`, so the app reaches the database simply via the service name `mysql` — no manual IP lookup is required.

### Access the application

Once the containers are up, open your browser and go to:

[http://localhost:8080](http://localhost:8080)

### Stop the application

```bash
docker-compose down
```

This stops and removes the containers, but **keeps** the `mysql-data` volume, so your ToDo data is preserved for the next `docker-compose up`.

To stop the containers **and** delete the persistent volume (full reset, all data lost):

```bash
docker-compose down -v
```

### View logs

```bash
docker-compose logs -f
```

Useful for confirming that migrations ran successfully and the server started without errors.