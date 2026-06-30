# Instructions

## Prerequisites

Make sure you have Docker and Docker Compose installed.

## Run the application

Start the application with Docker Compose in detached mode (with flag -d):

```bash
docker compose up -d
```

MySQL is started as part of the same Docker Compose stack, so no separate MySQL setup is required.

Once Docker Compose finishes starting the containers, the application will be available at:

[ToDo list webapp](http://localhost:8080/)  in your browser

# Stop the application

To stop the app and remove created containers, run:

```bash
docker compose down
```