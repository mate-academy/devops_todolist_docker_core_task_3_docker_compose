# Django-Todolist

Django-Todolist is a todolist web application with the most basic features of most web apps, i.e. accounts/login, API and (somewhat) interactive UI.

---
CSS | [Skeleton](http://getskeleton.com/)
JS  | [jQuery](https://jquery.com/)

## Explore

Make sure you have Docker installed.
Build and run docker containers with database and app:

```angular2html
docker-compose up -d
```

Now you can browse the [API](http://localhost:8000/api/)
or start on the [landing page](http://localhost:8000/)

Use the following command to stop containers:

```angular2html
docker-compose down
```

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








