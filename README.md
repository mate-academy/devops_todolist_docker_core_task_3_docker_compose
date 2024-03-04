# Django-Todolist

Django-Todolist is a todolist web application with the most basic features of most web apps, i.e. accounts/login, API and (somewhat) interactive UI.

## Docker Compose Usage
To run and stop containers with Docker Compose, follow these steps:

### Running Containers
1. Navigate to the directory containing the Docker Compose file.
   
```bash
    cd /full/path/to/devops_todolist_docker_core_task_3_docker_compose
```

1. Run the following command to start the containers:

```bash
    docker-compose up -d
```

This will build and start both the MySQL database and the Todolist app.

### Stopping Containers
To stop the containers you can run the following command:
```bash 
docker-compose down
``` 

Now you can browse the [API](http://localhost:8000/api/)
or start on the [landing page](http://localhost:8000/)








