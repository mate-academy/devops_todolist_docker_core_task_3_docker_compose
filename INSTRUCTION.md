# INSTRUCTION

## Running the Application

Build the images and start the containers:

```bash
docker compose up --build
```

Start the containers in detached mode (background):

```bash
docker compose up -d --build
```

The application will be available at: http://localhost:8081

## Stopping the Application

Stop the containers:

```bash
docker compose stop
```

Stop and remove the containers:

```bash
docker compose down
```

## Managing Containers

View running containers:

```bash
docker compose ps
```

View logs:

```bash
docker compose logs
```

View logs for a specific service:

```bash
docker compose logs todo-app
```

Restart the containers:

```bash
docker compose restart
```

Rebuild and start the application after making changes:

```bash
docker compose up --build
```

**Note:** MySQL data is stored in the Docker volume `db-data` and is preserved even after running `docker compose down`.