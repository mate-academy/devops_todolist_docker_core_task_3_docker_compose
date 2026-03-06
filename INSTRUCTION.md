# Running the Application

Start the containers using Docker Compose:

```bash
docker compose up -d
```

This command will:

* Build the application image
* Start the MySQL database container
* Run database migrations
* Start the Todolist application

---

# Access the Application

Open your browser and navigate to:

```
http://localhost:8080
```

---

# Stopping the Application

To stop and remove the running containers:

```bash
docker compose down
```