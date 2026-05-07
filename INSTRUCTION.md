# Instructions for Running and Stopping Containers with Docker Compose

# Prerequisites

1. docker --version
2. docker compose version 

# Starting Containers

To start all services defined in your docker-compose.yml file, use:

 1. docker compose up

If you want the containers to run in the background:

2. docker compose up -d

# Viewing Logs

1. docker compose logs

Follow Logs in Real Time

2. docker compose logs -f

View Logs for a Specific Service

3. docker compose logs <service_name>

# Stopping Containers

To stop all running containers without removing them:

1. docker compose stop

# Restarting Containers

To restart all services:

1. docker compose restart

To restart a specific service:

2. docker compose restart <service_name>

# Shutting Down and Removing Containers

To stop and remove containers, networks, and other resources created by Docker Compose:

1. docker compose down

Remove Containers + Volumes

2. docker compose down -v

Remove Containers + Images

3. docker compose down --rmi all

# Checking Container Status

To list all running containers:

1. docker compose ps