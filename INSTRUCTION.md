# Instructions for Running and Managing the Todo List Application with Docker Compose

This document provides instructions on how to build, run, and stop the Todo List application and its MySQL database using Docker Compose.

## Prerequisites

* [Docker](https://docs.docker.com/get-docker/) installed on your machine.
* [Docker Compose](https://docs.docker.com/compose/install/) installed (usually comes bundled with Docker Desktop or available as a plugin).


## Running the Application

1. Open your terminal and navigate to the root directory of the project containing the `docker-compose.yml` file.
2. Build and start all services in detached mode by running:
   docker compose up --build -d
This command will:

Build the custom Docker images for both the MySQL database and the Django application.

Create a dedicated Docker network (db-sql-net) allowing the containers to communicate.

Initialize a persistent Docker volume (db-data) to ensure your database records are safely stored on the host machine.

Automatically execute database migrations and start the Django development server via the container's entrypoint.

Once the containers are up and running, you can access the application in your browser:

Landing Page: http://localhost:8000/

API Endpoint: http://localhost:8000/api/

Stopping the Application
To stop the running containers without losing your persistent data, run:

docker compose stop
To stop and completely remove the containers and their network, run:

docker compose down
(Note: Your data will remain safe inside the Docker volume db-data even after running docker compose down.)

Viewing Logs
If you need to check the logs of your application or database for debugging purposes, use:

docker compose logs -f
