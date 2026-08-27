# Todo App - Docker Compose Instructions

## Run the Application

Run MySQL and Todo application containers:

docker compose up -d

The application will be available at:

http://localhost:8080

## Stop the Application

Stop the application:

docker compose down

The MySQL data is stored in a persistent Docker volume and remains available after the containers are stopped or removed.
