# Django-Todolist Docker Setup Instructions

## Prerequisites

- Docker and Docker Compose installed on your machine
- Python 3.8 or higher (for local development purposes)

## How to Run

1. **Build and start the containers:**
docker-compose up -d --build


2. **Check that containers are running:**
docker-compose ps

You should see both `mysql` and `pythonapp` services with status `Up`.

3. **View logs if needed:**
docker-compose logs -f

4. **Access the application:**
Open your browser and go to [http://localhost:8080](http://localhost:8080)

## How to Stop

- To stop and remove all containers, networks, and volumes created by docker-compose, run:
docker-compose down