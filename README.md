# Django-Todolist

A simple to-do list web application built with Django, MySQL, and Docker.

## Docker Setup Instructions

### 1. Running the MySQL Container
To run the MySQL container with a volume attached, use:
```bash
docker run -d --name mysql-container \
  -e MYSQL_ROOT_PASSWORD=rootpassword \
  -v mysql_data:/var/lib/mysql \
  -p 3306:3306 \
  vpcomtek/mysql-local:1.0.0
```
### 2. Running the Django Application Container
Run the Django app container:
```bash
docker run -d --name django-app -p 8080:8080 --link mysql-container:mysql-container \
  vpcomtek/todoapp:2.0.0

```
### 3. Accessing the Application
After starting both containers, open your browser and navigate to:

> [http://0.0.0.0:8080](http://localhost:8080)


### 4. Docker Hub Links
* [MySQL Image](https://hub.docker.com/r/vpcomtek/mysql-local)
* [Django Application Image](https://hub.docker.com/r/vpcomtek/todoapp)

## Docker Compose Setup Instructions
### 1. Run
```bash
docker-compose up -d
```
### 2. Stop containers
```bash
docker-compose down
```

### Sreenshot
> ![ToDoapp-docker-compose.png](ToDoapp-docker-compose.png)
