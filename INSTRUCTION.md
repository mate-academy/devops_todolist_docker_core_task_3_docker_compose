# Instructions to Run and Stop the Django-Todolist Application with Docker Compose

## Prerequisites
Install Docker and Docker Compose on your system. Ensure Python >= 3.8 is installed if you plan to make local changes.

## How to Run the Application
1. Clone your fork of the repository and navigate to the project directory:
   ```bash
   git clone https://github.com/YOUR_USERNAME/Django-Todolist.git
   cd Django-Todolist
   ```
2. Start the application with Docker Compose:
   ```bash
   docker-compose up --build
   ```
   This command will pull the required images, build the application, set up the MySQL database, and start the Django server at [http://localhost:8000](http://localhost:8000).

## How to Stop the Containers
To stop the application, run:
```bash
docker-compose down
```
This will stop all running containers and keep your MySQL data saved in the persistent volume.

## Data Persistence
Task data (`todos`) is stored in a MySQL database using the persistent volume `db_data`. This ensures your data remains accessible even after stopping the containers.

## Configuration Adjustments
You can modify environment variables for the database (e.g., `MYSQL_DATABASE`, `MYSQL_USER`, `MYSQL_PASSWORD`) in the `docker-compose.yml` file. After making changes, rebuild and restart the containers using:
```bash
docker-compose up --build
```

## Important Ports
- **Django Application**: Accessible at [http://localhost:8000](http://localhost:8000)  
- **MySQL Database**: Accessible at `localhost:3306` by default.

