# Docker Compose Setup for Django Todolist App with MySQL

# Project Overview:

In this task, I configured a docker-compose setup for a Django-based todo-list application using a MySQL database. The solution ensures data persistence through named volumes and executes all necessary setup commands at container startup.

# Tech stack:

- Docker & Docker Compose
- MySQL
- Python / Django
- Shell (entrypoint)

# What was done:

- Created a docker-compose.yml file to define and run two services: mysql and pythonapp.
- Used a custom Dockerfile.mysql to build the MySQL image and expose port 3306.
- Attached a named volume (db-data) to persist MySQL data at /var/lib/mysql.
- Removed RUN python manage.py migrate from the Django Dockerfile to avoid running migrations during build time.
- Refactored the ENTRYPOINT of the Django container to run migrations after the database becomes available.
- Ensured that the Django container waits for MySQL using depends_on with healthcheck.
- Created an INSTRUCTION.md file with step-by-step commands to run and stop the setup using Docker Compose.
- Todos are stored in MySQL and persist between restarts thanks to the named volume.

