# How to Run the Application with Docker Compose

## Prerequisites
- Docker
- Docker Compose

## Run the application

```bash
docker-compose up --build
```

This command will:
1. Build the MySQL image
2. Build the Django app image
3. Start MySQL container with a persistent volume
4. Run database migrations automatically
5. Start the application

## Access the application

Open your browser: http://localhost:8000

## Run in background (detached mode)

```bash
docker-compose up --build -d
```

## Stop the containers

```bash
docker-compose down
```

## Stop and remove volumes (clears database)

```bash
docker-compose down -v
```

## View logs

```bash
docker-compose logs -f
```