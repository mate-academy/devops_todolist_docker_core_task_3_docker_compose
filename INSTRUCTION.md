# Instructions: How to Setup and Run the Application with Docker Compose

## Prerequisites
Before running the commands below, make sure you have **Docker** and **Docker Compose** installed on your system.

---

## 1. Building and Running the Application
To build the Docker images and start all services (Django web app and MySQL database) in the background, run:
```bash
docker-compose up --build -d
```

Once the process is complete without any errors, you can access the application in your browser at:

Web App: http://localhost:8080/

API Endpoint: http://localhost:8080/api/

## 2. Stopping the Application
To stop the running containers without losing your data, use:
```bash
docker-compose down 
```

## 3.Stopping and Removing Volumes (Hard Reset)
Since MySQL uses a persistent volume (db_data), your data will remain safe even if you stop the containers. 
If you want to completely wipe the database and start fresh, run:

```bash
docker-compose down -v
```