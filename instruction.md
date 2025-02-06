How to Run and Stop Containers with Docker Compose

🚀 Running the Application
Ensure Docker and Docker Compose are Installed
If you haven't installed them, follow Docker installation guide before proceeding.

Navigate to the Project Directory
Open a terminal and go to the directory where docker-compose.yml is located:
cd /path/to/your/project

Build and Start the Containers
Run the following command to build images and start the containers in detached mode:
docker compose up -d
-d runs containers in the background.

Check Running Containers
Verify that both MySQL and the Python application are running:
docker compose ps

Check Logs
If you need to inspect logs:
docker compose logs -f pythonapp
docker compose logs -f mysql
Press CTRL + C to exit log streaming.

🛑 Stopping and Removing Containers
Stopping Containers (Graceful Shutdown)
To stop running containers without removing them:
docker compose stop

This will:
Stop all running containers.
Keep data stored in volumes.

Stopping a Specific Service
To stop only one container, e.g., the Python app:
docker compose stop pythonapp

Or for MySQL:
docker compose stop mysql

Restarting Containers
To restart all services:
docker compose restart

To restart just one service:
docker compose restart pythonapp

🗑 Removing Containers, Networks, and Volumes
Remove Containers Only
To remove all containers (but keep volumes and networks):
docker compose down

Remove Containers and Named Volumes
If you want to delete database data and start fresh:
docker compose down -v
⚠️ Warning: This will delete all database data stored in db-data volume.
