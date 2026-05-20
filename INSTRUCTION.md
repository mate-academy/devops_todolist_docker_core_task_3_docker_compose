### `INSTRUCTION.md`

```markdown
# Instructions to Run Django-Todolist with Docker Compose

This project is configured to run with a MySQL database using Docker Compose.

## How to Run the Application

To build the images and start both the MySQL database and the Django application in the background (detached mode), execute the following command:

```bash
docker-compose up -d --build

```

Once the containers are running and database migrations are automatically applied, you can access the application at:

* Landing Page: [http://localhost:8000/](https://www.google.com/search?q=http://localhost:8000/)
* API Root: [http://localhost:8000/api/](https://www.google.com/search?q=http://localhost:8000/api/)

## How to Stop the Application

To stop and remove the running containers without losing your data, run:

```bash
docker-compose down

```

If you want to stop the containers and completely wipe out the persistent database volume, use the `-v` flag:

```bash
docker-compose down -v
```