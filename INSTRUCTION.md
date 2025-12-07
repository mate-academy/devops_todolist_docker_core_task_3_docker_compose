### check compose versions. it should be 2.4.X

docker-compose --version

### go to downloaded project
cd devops_todolist_docker_core_task_3_docker_compose

### Optional: clear unused Docker data
###  **Warning:** the command below removes all unused images, containers, volumes and cache.

docker system prune --all

### From the devops_todolist_docker_core_task_3_docker_compose directory:
docker-compose up -d

### to check pythonapp logs

docker-compose logs -f pythonapp

### to check database logs

docker-compose logs -f mysql

### access todo app with http://localhost:8081 in web browser

### Stop and remove the application:
docker-compose down