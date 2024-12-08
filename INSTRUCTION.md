## Instructions to Run and Stop the Application with Docker Compose

### How to Build and Start the Containers:
1.	Open a terminal and navigate to the project directory.
2. Run the following command to build the images and start the containers:
```
docker-compose up --d
```
3. Once the command completes, you can access the application at:
 - Todo application: `http://localhost:8080`
 - Database: MySQL will run on port `3306` (only if exposed).

### How to Stop the Containers
1.	Open a terminal in the project directory.
2.	Run the following command to stop the containers:
```
docker-compose down
```
3.	This command will:
 - Stop all running containers.
 - Remove containers, networks, and any temporary volumes (but persistent volumes like `db_data` will remain intact).

### Persistent Data Storage
The application uses a persistent volume `db_data` to store the MySQL database files. This ensures that your data remains intact even if containers are stopped or removed.

### Environment Variables
Default Environment Variables:
 - MySQL:
   - MYSQL_ROOT_PASSWORD: example
   - MYSQL_DATABASE: app_db
   - MYSQL_USER: app_user
   - MYSQL_PASSWORD: 1234
 - Todo App:
   - APP_ENV: Development

### How to Modify Environment Variables:
1.	Open the docker-compose.yml file.
2.	Update the environment variables under db or todo-app services as needed.
3.	Rebuild and restart the containers:
```
docker-compose down
docker-compose up
```
