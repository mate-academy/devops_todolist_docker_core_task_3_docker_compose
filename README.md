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

1. Prepare a docker-compose file that will build and start both MySQL db and Todolist app
2. Remove RUN python manage.py migrate as the database is no longer available at the build time
3. Refactor ENTRYPOINT to execute both db migration and application start. Example:
`ENTRYPOINT ["sh", "-c", “command1 && command2”]`
4. The application should work with no issues after running docker-compose up
5. Update the README.md file by adding a new section with instructions on how to run and stop containers with docker-compose
6. Todos should be stored in MySQL Database, with a persistent volume connected
7. Create PR with your changes and attach it for validation on a platform

## Instructions how to run and stop containers with docker-compose
1. Download the application from github 
Execute the next command
git clone url_from_github
2. You have to have Docker Desktop application on your computer
3. Start your Docker Desktop application
4. Open terminal in project folder that you cloned
5. In order to start the application
Execute the next command
docker-compose up -d
6. In order to check the statuses of the containers
Execute the next command
docker-compose ps
7. Open your browser and enter the next URL
localhost:8080
8. In order to stop the containers
Execute the next command
docker-compose down






