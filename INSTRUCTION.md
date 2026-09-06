# Instructions — ToDo App with Docker Compose

## Run the application

From the project root (where `docker-compose.yml` is located), run:

```bash
docker compose up --build -d
```

This will:

- Build the `mysql` and `web` images from `Dockerfile.mysql` and `Dockerfile`
- Create a shared network so the app can reach the database by the service name `mysql`
- Create a persistent volume (`mysql_data`) so todo data survives container restarts
- Start the MySQL container and wait until it's healthy before starting the app container
- Run database migrations and start the Django development server automatically

## View logs

```bash
docker compose logs -f
```

Press `Ctrl+C` to stop following logs (this does not stop the containers).

## Access the application

Open your browser at:

http://localhost:8080

## Stop the containers

```bash
docker compose down
```

This stops and removes the containers, but keeps the `mysql_data` volume (your todo data is preserved).

To also delete the stored data (full reset), use:

```bash
docker compose down -v
```
