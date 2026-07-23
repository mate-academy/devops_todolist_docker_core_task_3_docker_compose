# Instructions for Running the Todolist Application

## Running the Application

1. **Build and start the containers:**
   Run the following command in the project root directory:
   ```bash
   docker-compose up --build
   
2. **Access the application**
    ```bash
    http://localhost:8081
   
3. **Stop containers**
    ```bash
   docker-compose down

4. **Run in detached mode**
    ```bash
    docker-compose up -d

5. **View application logs**
    ```bash
   docker-compose logs -f pythonapp