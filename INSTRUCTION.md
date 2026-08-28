# Todo App - Docker Compose Instructions

## Run the Application

Make sure Docker Desktop is running.

Open a terminal in the project directory where `docker-compose.yml` is located.

Build and start the MySQL database and Todo application:

docker compose up -d

The application will be available at:

http://localhost:8080

To view container logs:

docker compose logs

To check the status of the containers:

docker compose ps

## Stop the Application

Stop and remove the application containers:

docker compose down

The MySQL data is stored in a persistent Docker volume and remains available after the containers are stopped or removed.
