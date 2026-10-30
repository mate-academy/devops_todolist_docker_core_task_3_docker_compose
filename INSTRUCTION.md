# Django ToDo List — Docker Compose Instructions

## 1. Project Description

Django ToDo List is a web application that allows users to register, log in, create task lists, and manage their tasks.

The application uses:

- Python 3.8
- Django 4.1.10
- MySQL
- Docker
- Docker Compose
- Docker Volumes

Docker Compose is used to build and run the Django application and MySQL database together.

The MySQL database uses a persistent Docker Volume to preserve application data after containers are stopped or removed.

## 2. Prerequisites

Before starting, make sure the following software is installed:

- Docker Desktop
- Docker Compose (included with Docker Desktop)
- Git

Docker Desktop must be running before executing Docker Compose commands.

Port `8082` must be available on the host machine.

## 3. Clone the Repository

Clone the repository from GitHub:

```bash
git clone https://github.com/KoLpI76/devops_todolist_docker_core_task_3_docker_compose.git
```

Navigate to the project directory:

```bash
cd devops_todolist_docker_core_task_3_docker_compose
```

Switch to the solution branch:

```bash
git switch task_solution
```

## 4. Project Structure

The project contains the following important files:

```text
devops_todolist_docker_core_task_3_docker_compose/
├── accounts/
├── api/
├── lists/
├── todolist/
│   └── settings.py
├── Dockerfile
├── Dockerfile.mysql
├── docker-compose.yml
├── INSTRUCTION.md
├── manage.py
└── requirements.txt
```

### Dockerfile

The `Dockerfile` builds the Django application image.

Database migrations are not executed during the image build.

Instead, the container executes migrations before starting Django:

```dockerfile
ENTRYPOINT ["sh", "-c", "python manage.py migrate && exec python manage.py runserver 0.0.0.0:8080"]
```

This ensures migrations run after the MySQL database becomes available.

### Dockerfile.mysql

The `Dockerfile.mysql` builds the MySQL database image.

The database configuration includes:

```text
Database: app_db
Username: app_user
Password: 1234
MySQL port: 3306
```

These credentials are intended for educational use only.

### docker-compose.yml

The Docker Compose configuration defines two services:

- `db` — MySQL database.
- `web` — Django application.

Docker Compose automatically creates a network that allows the services to communicate.

The Django application connects to MySQL using the hostname `db`.

## 5. Build and Start Containers

Open a terminal in the project directory.

Run:

```bash
docker compose up --build -d
```

This command:

1. Builds the Django Docker image.
2. Builds the MySQL Docker image.
3. Creates the Docker network.
4. Creates the persistent MySQL volume.
5. Starts the MySQL container.
6. Waits for the MySQL health check to pass.
7. Starts the Django container.
8. Runs Django database migrations.
9. Starts the Django development server.

The `-d` option runs containers in the background.

For subsequent starts, use:

```bash
docker compose up -d
```

## 6. Verify Running Containers

Check container status:

```bash
docker compose ps
```

Expected containers:

```text
todolist-django
todolist-mysql
```

Expected status:

```text
todolist-django   Up
todolist-mysql    Up (healthy)
```

The Django application uses the following port mapping:

```text
8082:8080
```

Port `8082` is available on the host machine.

Port `8080` is used inside the Django container.

The MySQL database is accessible to Django through the Docker Compose network.

## 7. Access the Application

Open a browser and navigate to:

**Django application:**

http://localhost:8082/

**Django REST API:**

http://localhost:8082/api/

The application supports:

- User registration.
- User login.
- Creating task lists.
- Adding Todo items.
- Managing completed and uncompleted tasks.

## 8. View Container Logs

To view Django logs:

```bash
docker compose logs web
```

To view the last 40 lines:

```bash
docker compose logs --tail=40 web
```

To view MySQL logs:

```bash
docker compose logs db
```

To follow logs in real time:

```bash
docker compose logs -f
```

Successful Django startup should include messages similar to:

```text
Operations to perform:
  Apply all migrations: admin, auth, contenttypes, lists, sessions

Running migrations:
  Applying lists.0001_initial... OK

System check identified no issues (0 silenced).

Starting development server at http://0.0.0.0:8080/
```

On subsequent starts, Django may display:

```text
No migrations to apply.
```

This is expected when the database schema already exists.

## 9. MySQL Database Configuration

The Django application uses MySQL instead of SQLite.

Database configuration in `todolist/settings.py`:

```python
DATABASES = {
    "default": {
        "ENGINE": "mysql.connector.django",
        "NAME": "app_db",
        "USER": "app_user",
        "PASSWORD": os.environ.get("MYSQL_PASSWORD", "1234"),
        "HOST": os.environ.get("MYSQL_HOST", "db"),
        "PORT": "",
    }
}
```

The hostname `db` corresponds to the MySQL service defined in `docker-compose.yml`.

Docker Compose provides internal DNS resolution between services.

The empty `PORT` setting uses the default MySQL port `3306`.

## 10. Persistent MySQL Volume

The MySQL database stores its files in a named Docker Volume.

The Docker Compose configuration includes:

```yaml
volumes:
  mysql-data:
```

The MySQL service mounts this volume:

```yaml
volumes:
  - mysql-data:/var/lib/mysql
```

The volume preserves:

- Registered users.
- Task lists.
- Todo items.
- Database tables.
- Django migration history.

To view Docker volumes:

```bash
docker volume ls
```

The expected volume name is:

```text
devops_todolist_docker_core_task_3_docker_compose_mysql-data
```

To inspect the volume:

```bash
docker volume inspect devops_todolist_docker_core_task_3_docker_compose_mysql-data
```

## 11. Test Database Persistence

To verify that data persists after containers are removed:

1. Open the Django application.
2. Register a test user.
3. Create a Todo item.
4. Stop and remove the containers.
5. Start the containers again.
6. Verify that the Todo item still exists.

Example Todo:

```text
Docker Compose persistence test
```

Stop and remove containers:

```bash
docker compose down
```

Start them again:

```bash
docker compose up -d
```

Open:

http://localhost:8082/

Log in and verify that the previously created Todo item is still available.

This confirms that MySQL data is stored in the persistent Docker Volume.

**Important:** Do not use `docker compose down -v` when you want to preserve database data.

## 12. Stop Containers

To stop running containers without removing them:

```bash
docker compose stop
```

To start stopped containers:

```bash
docker compose start
```

To stop and remove containers and the Docker Compose network:

```bash
docker compose down
```

The persistent MySQL volume is retained.

## 13. Restart Containers

To restart all services:

```bash
docker compose restart
```

To restart only Django:

```bash
docker compose restart web
```

To restart only MySQL:

```bash
docker compose restart db
```

If MySQL is restarted separately, wait until it is healthy before restarting Django.

## 14. Rebuild Containers

After changing the Dockerfile, dependencies, or application source code, rebuild the images:

```bash
docker compose up --build -d
```

To rebuild without starting containers:

```bash
docker compose build
```

## 15. Remove Containers and Database Data

To remove containers while preserving the database:

```bash
docker compose down
```

To remove containers and their named volumes:

```bash
docker compose down -v
```

**Warning:** The `-v` option removes the MySQL database volume and deletes the stored application data.

Use this command only when intentionally resetting the database.

## 16. Troubleshooting

### Port 8080 is already in use

If port `8080` is occupied by another application or Docker container, use the following port mapping in `docker-compose.yml`:

```yaml
ports:
  - "8082:8080"
```

Then run:

```bash
docker compose up -d
```

Open the application at:

http://localhost:8082/

### Django cannot connect to MySQL

Verify that MySQL is running:

```bash
docker compose ps
```

Check MySQL logs:

```bash
docker compose logs db
```

Check Django logs:

```bash
docker compose logs web
```

Make sure Django uses the hostname `db` and that both services are defined in the same Docker Compose project.

### Database migrations fail

Verify that MySQL is healthy:

```bash
docker compose ps
```

Check Django logs:

```bash
docker compose logs web
```

The Django container runs migrations automatically during startup.

### Application does not open

Check the containers:

```bash
docker compose ps
```

Check the Django logs:

```bash
docker compose logs --tail=40 web
```

Verify that port `8082` is available.

## 17. Security Notes

This configuration is intended for educational and development purposes.

For production environments:

- Do not store passwords directly in configuration files.
- Use environment variables or Docker secrets.
- Disable Django debug mode.
- Configure appropriate allowed hosts.
- Restrict access to the MySQL database.
- Use a production-ready application server.
- Create regular database backups.

## 18. Conclusion

The Django ToDo List application is successfully containerized using Docker Compose.

The setup provides:

- Automatic building and startup of Django and MySQL.
- Automatic Django database migrations.
- MySQL readiness checks.
- Communication between services through Docker networking.
- Persistent storage using a Docker Volume.
- Simple commands for starting, stopping, restarting, and rebuilding containers.

The application can be started with:

```bash
docker compose up --build -d
```

And stopped with:

```bash
docker compose down
```

The MySQL database data remains available after the containers are removed and recreated.
