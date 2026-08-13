# Todolist App Run Instructions

## Prerequisites
Ensure that **Docker** and **Docker Compose** are installed on your system.

## Running the Application
To build the images and start the containers in detached (background) mode, run:
```
docker-compose up -d --build
```
Once started, the application will be available at:
http://localhost:8080

## Viewing Logs

To view logs for all running services:

```
docker-compose logs -f
```

## Stopping Containers

To stop and remove containers while preserving data in the database:

```
docker-compose down
```

## Complete Data Cleanup

If you need to stop the containers and delete all volumes (complete database reset):

```
docker-compose down -v
```