After launching locally the web app can be accessed at http://localhost:8080/

Before running the application pull the images:
docker pull niklafinskiy/todoapp:2.0.0
docker pull niklafinskiy/mysql-local:1.0.0

(Located at https://hub.docker.com/repository/docker/niklafinskiy/todoapp/ and https://hub.docker.com/repository/docker/niklafinskiy/mysql-local/)

After pulling run the following commands in order to start the application (or use docker-compose with "docker compose up"):

docker network create todoapp-network

docker volume create mysql-data

docker run --name mysql-db -d -p 3306:3306 --network todoapp-network -v mysql-data:/var/lib/mysql -e MYSQL_USER=app_user -e MYSQL_PASSWORD=1234 -e MYSQL_DATABASE=app_db -e MYSQL_ROOT_PASSWORD=1234 

docket run --name todoapp -d -p 8080:8080 --network todoapp-network --restart unless-stopped niklafinskiy/todoapp:2.0.0

