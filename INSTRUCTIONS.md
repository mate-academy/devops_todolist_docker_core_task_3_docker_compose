1. **Clone the Repository**
   ```bash
   git clone <REPOSITORY_URL>
   cd devops_todolist_docker_core_task_3_docker_compose
   ```

2. **Start the Containers**
   Run the command to start all services in the background:
   ```bash
   docker-compose up -d
   ```

3. **Check Container Status**
   Ensure all containers are running:
   ```bash
   docker ps
   ```

4. **Access the Application**
   Open your browser and go to:
   ```
   http://localhost:8000
   ```

## Stopping the Containers
To stop all running containers, execute:
```bash
docker-compose down
```