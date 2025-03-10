## Instructions for launching "Todo App"

## Clone the repository
````bash
git clone https://github.com/betterthink/devops_todolist_docker_core_task_3_docker_compos
````
## Building docker compose file
### 1. Create file 
````bash
touch docker-compose.yml
````
### 2. Refactor ENTRYPOINT inside the Dockerfile
````
ENTRYPOINT ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8080"]
````
### 3. Writing the docker-compose file
````
version: '3'
networks:
  db-data-net:
    driver: bridge
services:
  mysql:
    image:
      my-sql:1.0.0
    build:
      context: .
      dockerfile: Dockerfile.mysql
    container_name: my-sql
    ports:
      - "3306:3306"
    volumes:
      - db-data:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=1234
      - MYSQL_DATABASE=app_db
      - MYSQL_USER=app_user
      - MYSQL_PASSWORD=1234
    networks:
      - db-data-net
  pythonapp:
    image: todoapp:1.0.0
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "8080:8080"
    networks:
      - db-data-net
    depends_on:
      - mysql
    restart: unless-stopped
volumes:
    db-data:

````
### 4. Run Docker compose file
````bash
docker-compose up -d
````
-d for detached mode
### 5. Stop Docker compose file
````bash
docker-compose stop 
````
## Access via browser
For access via browser follow the link 
 ```
 http://localhost:8080
 ```