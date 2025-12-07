### Optional: clear unused Docker data
###  **Warning:** the command below removes all unused images, containers, volumes and cache.

docker system prune --all

### From the devops_todolist_docker_core_task_3_docker_compose directory:
docker-compose up -d

### Stop and remove the application:
docker-compose down