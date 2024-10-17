MySQL image: https://hub.docker.com/repository/docker/levandrii1/mysql-local/general
Todoapp image: https://hub.docker.com/repository/docker/levandrii1/todoapp/general

## Instructions:

### Running containers manually:

1. Pull both images:
```bash
docker pull levandrii1/mysql-local:1.0.0
docker pull levandrii1/todoapp:2.0.0
```

2. Run MySQL container: 
```bash
docker run --name mysql_container -v mysql_data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root_password -d mysql-local:1.0.0
```

3. Open settings.py, edit the HOST setting in the DATABASES section on line #70 with your mysql_container IP address.

4. Build and run the app container:
```bash
docker run --name todoapp_container -p 8080:8080 todoapp:2.0.0
```

5. Access the app. Open the web browser and go to: http://localhost:8080/


### Running with docker-compose
Using Docker Compose allows you to run both containers simultaneously.

1. Start the containers:
```bash
docker-compose up
```

2. Access the app. Open the web browser and go to: http://localhost:8080/

3. To stop and remove the containers:
```bash
docker-compose down
```
This command stops the containers and removes them. The data will still be saved in your local MySQL database.