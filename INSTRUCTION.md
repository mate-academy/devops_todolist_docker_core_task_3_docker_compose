 Instructions

1. Run with Docker Compose
Start the services:
docker-compose up -d
This will:

Build and start a MySQL container (mysql_db) with persistent volume: db-data (/var/lib/mysql).

Build and start the Django application container (todoapp).

Ensure both containers are connected via network db-data-net.

2. Check Running Containers
bash

docker ps
3. Access the Application
Open in browser: http://localhost:8000

4. Stop the Containers
bash
ь
docker-compose down
5. Remove Volumes (Optional)
bash

docker-compose down -v