# INSTRUCTIONS.md

## Django-Todolist: A Simple Todo List Web Application

Django-Todolist is a minimal web application that combines essential features like user accounts, APIs, and a basic interactive UI. It uses CSS (Skeleton), JavaScript, and jQuery for styling and interactivity.

### Prerequisites
- Docker and Docker Compose installed on your system.

### Running the Application with Docker Compose
Follow these steps to run the Django-Todolist application:

#### Step 1: Clone the Repository
1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/MykhailoIvchenko/devops_todolist_docker_core_task_3_docker_compose.git
   cd devops_todolist_docker_core_task_3_docker_compose
   ```

#### Step 2: Start the Application
1. Use Docker Compose to build and start the containers:
   ```bash
   docker-compose up --build
   ```
2. This command will:
   - Start the MySQL database service.
   - Run database migrations automatically.
   - Launch the Django-Todolist application.

3. Once started, access the application in your web browser at:
   [http://localhost:8000](http://localhost:8000).

#### Step 3: Stop the Application
1. To stop the running containers, use the following command:
   ```bash
   docker-compose down
   ```
2. This will stop and remove the containers while preserving the MySQL data thanks to the persistent volume.

#### Step 4: Clean Up (Optional)
If you wish to remove all containers, volumes, and networks created by Docker Compose:
```bash
   docker-compose down --volumes
```

### Notes
- The MySQL database is configured with a persistent volume to ensure that your data is not lost when the containers are stopped.
- Ensure that all required environment variables are correctly set in the `docker-compose.yml` file before running the application.

Enjoy using Django-Todolist!
