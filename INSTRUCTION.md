# Docker Compose Deployment: Django ToDo App + MySQL

This project uses Docker Compose to orchestrate the Django application and the MySQL database.

## Prerequisites
- Docker
- Docker Compose

## Quick Start

### 1. Build and Run
Run the following command in the project root to build images and start services:

```bash
docker-compose up --build
The application will be available at: http://localhost:8080

Note: Database migrations run automatically on container startup.

2. Stop Containers
To stop the services and remove containers (data in volumes will be preserved):

Bash
docker-compose down
3. Stop and Remove Volumes
To stop and also remove the database volume (WARNING: all data will be lost):

Bash
docker-compose down -v