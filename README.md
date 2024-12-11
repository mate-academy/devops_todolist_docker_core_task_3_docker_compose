# Django-Todolist

Django-Todolist is a todolist web application with the most basic features of most web apps, i.e. accounts/login, API and (somewhat) interactive UI.

---
CSS | [Skeleton](http://getskeleton.com/)
JS  | [jQuery](https://jquery.com/)

# Running Containers
To run docker-compose and start your containers, follow these steps:

Open Terminal.

Navigate to your project directory where the docker-compose.yml file is located.

Run the following command to start your containers:


docker-compose up  
This command will:

Build images (if necessary) based on the specified Dockerfile.
Start the defined services in detached mode.
To run in detached mode (background), add the -d flag:


docker-compose up -d  
This allows you to use your terminal for other commands while your containers are running.

View logs (if needed):
To see the logs from your running services, use:


docker-compose logs  
For logs from a specific service, specify the service name:


docker-compose logs web  
Step 3: Stopping Containers
You can stop your running containers with the following command:

Open Terminal.

Navigate to your project directory where the docker-compose.yml file is located.

Run the following command:


docker-compose down  
This command will:

Stop and remove all containers defined in the docker-compose.yml file.
Remove any networks created by docker-compose up.
If you want to stop the containers without removing them, you can use:


docker-compose stop  
This stops the containers but does not remove them, allowing you to start them again later without rebuilding.

### MySQL Database, with a persistent volume connected





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








