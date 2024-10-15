# Django-Todolist
This is a simple Django-based To-Do List application built with Docker.

## GitHub

### Clone the Repository
If you're working with the source code, clone the project repository:

git clone https://github.com/L1mbxbx/devops_todolist_docker_core_task_2_volumes/tree/develop cd devops_todolist

## Building your application
To build your application, run this command in terminal:

docker-compose up -d

## Access the Application in a Browser
Once the container is running, open a web browser and go to:

http://localhost:8080

## Stoping Containers
o stop the running container, find the container ID using:

docker-compose down

## Deleting Images and containers
To delete all your images and containers run following command in terminal:

docker system prune -a
