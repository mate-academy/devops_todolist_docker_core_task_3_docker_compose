## Build and Start Containers

docker compose up --build -d

Docker Compose will:

- build the MySQL image from Dockerfile.mysql;
- build the Django application image from Dockerfile;
- create a persistent MySQL volume;
- start the MySQL container;
- wait until MySQL is ready;
- run Django database migrations;
- start the Django development server on port 8080.

## Check Containers

docker compose ps

## Check Logs

View logs for all containers:

docker compose logs

View Django application logs:

docker compose logs todoapp

View MySQL logs:

docker compose logs mysql-todo

## Access Application

Open the application in a browser:

http://localhost:8080

API:

http://localhost:8080/api/

## Stop Containers

Stop running containers:

docker compose stop

## Start Containers Again

docker compose start

## Stop and Remove Containers

docker compose down

The MySQL data is stored in the persistent mysql_data volume and remains available after the containers are removed.

## Remove Containers and Database Data

To remove containers together with the persistent database volume:

docker compose down -v

Warning: this command deletes the MySQL database data.