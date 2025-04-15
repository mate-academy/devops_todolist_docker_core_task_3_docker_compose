# Instructions for Running and Stopping Django-Todolist with Docker Compose

## Requirements
- Docker and Docker Compose installed.
- Python >= 3.8 (for local development, if needed).
- A fork of the Django-Todolist repository.

## Running the Application

1. **Clone the Repository**:
   ```bash
   git clone <URL_of_your_fork>
   cd <repository_name>
   ```

2. **Start Docker Compose**:
   ```bash
   docker-compose up --build
   ```
   - This command builds the images for the application and MySQL, runs database migrations, and starts the server.
   - The application will be available at: `http://localhost:8081`.
   - MySQL will be accessible on port `3306` (if external access is needed).

3. **Verify Functionality**:
   - Open a browser and navigate to `http://localhost:8081`.
   - The API and UI should be fully functional.
   - Task data is stored in MySQL using a persistent volume.

## Stopping the Containers

1. **Stop the Containers**:
   ```bash
   docker-compose down
   ```
   - This command stops and removes the containers while preserving the data in the persistent `db-data` volume.

2. **(Optional) Remove Volumes**:
   To completely delete the database data:
   ```bash
   docker-compose down -v
   ```

## Additional Notes
- If you make changes to the code, rebuild the images with `docker-compose up --build`.
- To access MySQL, use:
  - Host: `mysql`
  - User: `app_user`
  - Password: `1234`
  - Database: `app_db`
```