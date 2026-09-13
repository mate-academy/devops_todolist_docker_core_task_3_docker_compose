# Django ToDo App Containerization with Docker Compose

This repository contains a containerized Django ToDo application with a MySQL database back-end managed entirely via Docker Compose.

---

## Instructions for Running the Application

Follow these simple steps to build, configure, and run the entire application infrastructure locally using a single command:

### Step 1: Start the Infrastructure
Run the following command in your terminal from the root directory of the project. This will automatically build your local Dockerfiles, create networks/volumes, and start both the database and the web application in the background (detached mode):

```bash
docker-compose up -d --build
```

*Note: Database migrations (`python manage.py migrate`) will automatically run inside the application container during initialization as part of the container's entrypoint script.*

### Step 2: Verify the Containers
To ensure that both the Django application and the MySQL database services are up and running successfully, execute:

```bash
docker-compose ps
```

---

## How to Access the Application

Once the containers are up and running:
1. Open your web browser.
2. Navigate to: **http://localhost:8000**
3. You can now use the interactive Django-Todolist application, which is securely connected to the MySQL container.
4. You can also browse the API endpoints directly at: **http://localhost:8000/api/**

---

## How to Stop the Application

To safely stop the application and remove the created containers and internal networks without losing your data, run:

```bash
docker-compose down
```

*Data Persistence: Your ToDos are safely stored inside the managed persistent volume `db-data` and will remain intact even after stopping or removing the containers.*
