# Instructions to Run and Stop Containers with Docker Compose

## Prerequisites
- Ensure Docker and Docker Compose are installed on your machine.
- Clone the repository and navigate to the project directory.

## Steps to Run the Containers

1. **Build and Start the Containers:**
   - Open a terminal and navigate to the project directory.
   - Run the following command to build and start the containers:
     ```sh
     docker-compose up --build
     ```

2. **Verify the Services:**
   - Once the containers are up and running, you can verify the services:
     - MySQL database should be accessible on port `3306`.
     - Django application should be accessible on port `8080`.

3. **Database Migration:**
   - The `ENTRYPOINT` in the `Dockerfile` is configured to run database migrations and start the Django application automatically.

## Steps to Stop the Containers

1. **Stop the Containers:**
   - To stop the running containers, use the following command:
     ```sh
     docker-compose down
     ```

2. **Remove Volumes (Optional):**
   - If you want to remove the persistent volumes created by Docker Compose, use the following command:
     ```sh
     docker-compose down -v
     ```

## Additional Commands

- **View Logs:**
  - To view the logs of the running containers, use:
    ```sh
    docker-compose logs
    ```

- **Restart Services:**
  - To restart the services, use:
    ```sh
    docker-compose restart
    ```

- **Scale Services:**
  - To scale the services (e.g., running multiple instances of the Django application), use:
    ```sh
    docker-compose up --scale pythonapp_service=<number_of_instances>
    ```

## Notes
- Ensure that the `docker-compose.yml` file and `Dockerfile` are correctly configured as per the project requirements.
- The MySQL database credentials and other environment variables should be correctly set in the `docker-compose.yml` file.