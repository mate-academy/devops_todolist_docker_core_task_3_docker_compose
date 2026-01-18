# Project Deployment Instruction (Docker Compose)

This guide provides instructions on how to build, run, and stop the ToDo application using Docker Compose.
The setup includes a Django web application and a MySQL database

## 1. Prerequisites
Docker and Docker Compose installed on your machine.
A cloned version of this repository:
https://github.com/mate-academy/devops_todolist_docker_core_task_3_docker_compose.git

## 2. Running the Application
To build the images and start all services in the background,
run the following command from the project root:
```bash
docker-compose up -d --build
```

## 3. Accessing the App
```bash
URL: http://localhost:8080
```

## 4. Stopping and remove the Application
```bash
docker-compose down
```

## 5. Troubleshooting
```bash
docker-compose logs -f pythonapp
```