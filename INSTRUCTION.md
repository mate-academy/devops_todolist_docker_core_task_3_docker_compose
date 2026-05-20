# Instructions

## How to run

Build and start all containers:
```bash
    docker-compose up --build
```
Run in background (detached mode):
```bash
    docker-compose up --build -d
```
## How to stop

Stop containers:
```bash
    docker-compose down
```
Stop and remove volumes (deletes database data):
```bash
    docker-compose down -v
```