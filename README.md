# Django-Todolist

Django-Todolist is a todolist web application with the most basic features of most web apps, i.e. accounts/login, API and (somewhat) interactive UI.

---
CSS | [Skeleton](http://getskeleton.com/)
JS  | [jQuery](https://jquery.com/)

## Explore
Try it out by installing the requirements. (Works only with python >= 3.8, due to Django 4)

    pip install -r requirements.txt

Create a database schema:

    python manage.py migrate

And then start the server (default: http://localhost:8000)

    python manage.py runserver


Now you can browse the [API](http://localhost:8000/api/)
or start on the [landing page](http://localhost:8000/)

## Task
#### Prerequisites
- Fork this repository

#### Requirements

1. Prepare a `docker-compose.yml` file that will build and start both MySQL db and Todolist app
2. Remove RUN python manage.py migrate as the database is no longer available at the build time
3. Refactor ENTRYPOINT to execute both db migration and application start. Example:
`ENTRYPOINT ["sh", "-c", “command1 && command2”]`
4. The application should work with no issues after running docker-compose up
5. Create the `INSTRUCTION.md` file with detailed instructions on how to run and stop containers with docker-compose
6. Todos should be stored in MySQL Database, with a persistent volume connected
7. Create PR with your changes and attach it for validation on a platform







## Docker Setup

### Prerequisites
- Docker
- Docker Compose

### Running the Application

To build and start the application using Docker Compose, follow these steps:

1. **Build the Docker images:**
   ```sh
   docker-compose build

2. **Start the services:**
   ```sh
   docker-compose up
3. **Access the application:**
Open your web browser and navigate to http://localhost:8080.

4. **Stopping the Application**
To stop the running containers, use the following command:
   ```sh
    docker-compose down
