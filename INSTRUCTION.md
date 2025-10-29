## Prerequisites
- Docker and Docker Compose must be installed
- Clone or fork this repository
## Build containers
Run the following command to build the images for both MySQL and Django app:
```bash
docker compose build


Run the application
## Start all containers (MySQL + Django app):

docker compose up

## or in detached mode:

docker compose up -d

This command will:
- Start the MySQL database container
- Run database migrations automatically
- Launch the Django app on port 8080

## Stop the containers

To stop and remove all running containers, networks, and volumes:

docker compose down

If you want to keep database data, omit the -v flag.
To remove database data as well:

docker compose down -v

## Check the application
After successful start, open your browser and visit:
http://localhost:8080

## View logs
To see logs for all containers:

docker compose logs -f

To see logs only for Django app:

docker compose logs todoapp