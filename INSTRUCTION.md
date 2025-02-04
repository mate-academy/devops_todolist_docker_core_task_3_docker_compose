# Instructions for Running and Stopping Containers with Docker Compose

## Prerequisites

- **Docker** and **Docker Compose** must be installed on your system.
- Ensure you have the `docker-compose.yml`, `Dockerfile`, and `Dockerfile.mysql` in the same directory.

## Running the Containers

1. **Navigate to the Project Directory:**  
   Open your terminal and change the directory to where your `docker-compose.yml` file is located:

   ```bash
   cd /path/to/your/project
   ```

2. **Build and Start Containers:**  
   To build the images and start the containers, run:

   ```bash
   docker-compose up --build
   ```

   - The `--build` flag ensures that Docker rebuilds the images based on any recent changes.
   - If the images are already built and no changes were made, you can start the containers without rebuilding:

   ```bash
   docker-compose up
   ```

3. **Run Containers in Detached Mode (Optional):**  
   If you want the containers to run in the background:

   ```bash
   docker-compose up -d
   ```

4. **Verify Running Containers:**  
   To check if the containers are running:

   ```bash
   docker ps
   ```

## Stopping the Containers

1. **Gracefully Stop Containers:**  
   In the project directory, run:

   ```bash
   docker-compose down
   ```

   This command stops and removes the containers, networks, and default volumes created by `docker-compose up`.

2. **Stopping Containers Without Removing Data:**  
   If you just want to stop the containers without removing them:

   ```bash
   docker-compose stop
   ```

3. **Restarting Containers:**  
   To restart the containers:

   ```bash
   docker-compose restart
   ```

## Managing Volumes and Networks

- **Remove All Volumes (Warning: This deletes data):**  
  If you want to remove volumes along with the containers:

  ```bash
  docker-compose down -v
  ```

- **Prune Unused Docker Resources:**  
  To clean up unused Docker data:

  ```bash
  docker system prune -f
  ```

## Additional Commands

- **View Logs:**  
  To see the logs for all services:

  ```bash
  docker-compose logs
  ```

  Or for a specific service (e.g., `mysql`):

  ```bash
  docker-compose logs mysql
  ```

- **Execute Commands Inside a Running Container:**  
  For example, to open a bash shell inside the `pythonapp` container:

  ```bash
  docker-compose exec pythonapp bash
  ```

---

Following these instructions will help you efficiently manage your Docker containers using Docker Compose.
