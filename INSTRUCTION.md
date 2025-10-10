

# INSTRUCTION.md

## How to run the project

1. Clone the project from GitHub  
   ```
   git pull https://github.com/DemqN96/devops_todolist_docker_core_task_3_docker_compose
   ```

2. Create a file named **docker-compose.yml**  
   Add the code from your task inside this file.

3. Start the project  
   ```
   docker compose up -d
   ```

4. Check if it is working  
   ```
   docker ps
   docker logs app
   ```
   If all is good, open in your browser:  
   [http://localhost:8080/](http://localhost:8080/)  

   To see the API page, open:  
   [http://localhost:8080/api/](http://localhost:8080/api/)

5. Stop the project  
   ```
   docker compose down
   ```

6. Start again if needed  
   ```
   docker compose up -d
   ```

***

[1](https://github.com/DemqN96/devops_todolist_docker_core_task_3_docker_compose)