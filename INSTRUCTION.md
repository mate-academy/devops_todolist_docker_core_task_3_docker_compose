### check Docker Engine and Docker Compose versions. 
### Requirements Docker Engine >= 20.10.0 and Docker Compose v1.29.x
docker --version
docker-compose --version

### Optional: clear unused Docker data
###  **Warning:** the command below removes all unused images, containers, volumes and cache.
docker system prune --all

### run all the following commands from the repository root
### From the devops_todolist_docker_core_task_3_docker_compose directory:
docker-compose up --build -d

### if you want to see foreground logs run as
docker-compose up

### to check pythonapp logs

docker-compose logs -f pythonapp

### to check database logs

docker-compose logs -f mysql

### access todo app with http://localhost:8081 in web browser

### Stop and remove the application:
docker-compose down