# ToDo Django Application with MySQL and Docker Compose

This document describes how to run the **ToDo Django application** and **MySQL database** in Docker containers using **Docker Compose**.

## Prerequisites

Before running the application, make sure that Docker and Docker Compose are installed on your system.

You can find installation instructions for your operating system in the official Docker documentation:

https://docs.docker.com/engine/install/

## Application Structure

The application consists of two Docker containers:

- `mysql` — MySQL database server
- `todoapp` — Django ToDo application

Both containers are managed using Docker Compose.

## Run the Application

Start the application in detached mode:

```bash
docker compose up -d
```

Docker Compose will build and start all required containers.

You can check the status of the running containers with:

```bash
docker compose ps
```

## MySQL Configuration

The MySQL container is configured with the following environment variables:

```text
MYSQL_ROOT_PASSWORD=1234
MYSQL_DATABASE=app_db
MYSQL_USER=app_user
MYSQL_PASSWORD=1234
```

MySQL uses port `3306` inside the container. For external database access, it is mapped to port `3310` on the host machine.

Database data is stored in a Docker volume and persists between container restarts.

## Access the Application

The ToDo application is available on port `8080`.

After the containers have started, open the following address in your browser:

http://localhost:8080/

During application startup, Django database migrations are executed automatically. The required database tables for storing ToDo application data are created in the MySQL database.

## Stop the Application

To stop and remove the application containers, run:

```bash
docker compose down
```

The database volume is preserved by default.

## Screenshots

Console screenshots of the running application are included in the repository:

- `Screenshot.png`
- `Screenshot-1.png`

The screenshots are also available at:

https://files.catbox.moe/jazrjy.png

https://files.catbox.moe/ks8qiu.png