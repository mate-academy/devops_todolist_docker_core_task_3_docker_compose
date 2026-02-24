# Todolist Docker Setup

## Requirements

- Docker
- Docker Compose

## Build and Start

docker-compose up --build

Application will be available at:
http://localhost:8080

## Stop Containers

docker-compose down

## Stop and Remove Volumes (delete database)

docker-compose down -v

## Rebuild Without Cache

docker-compose build --no-cache
