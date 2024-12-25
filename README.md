## Setup and Usage

1. **Clone the repository:**

   ```bash
   git clone https://github.com/vk-workshop/devops_todolist_docker_core_task_3_docker_compose.git
   cd devops_todolist_docker_core_task_3_docker_compose
   ```
2. **Build and start containers:**

   Run the following command to build and start the services:

   ```bash
   docker-compose up -d
   ```

   This will:
   - Start a MySQL container.
   - Build and start the Python Django application.

3. **Access the application:**

- The Django application is accessible at `http://localhost:8081`.
- MySQL is available on port `3306`.


4. **Stop the containers:**

   To stop the running containers:

   ```bash
   docker-compose down
   ```