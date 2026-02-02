# Docker Compose Instructions

This document provides step-by-step instructions on how to build, run, verify, and stop the application using **Docker Compose**.

---

## 📦 Prerequisites

Make sure the following tools are installed on your machine:

- **Docker** (version 20+ recommended)
- **Docker Compose** (v1 or v2)

Verify installation:

```bash
docker --version
docker-compose --version
```

---

## 🗂 Project Structure (simplified)

```text
.
├── Dockerfile
├── Dockerfile.mysql
├── docker-compose.yml
├── requirements.txt
├── manage.py
└── INSTRUCTION.md
```

---

## 🚀 How to Build and Run the Containers

From the project root directory, run:

```bash
docker-compose up --build
```

### What this command does:

- Builds the **application container** (`todo-app`)
- Builds and starts the **MySQL container**
- Creates a Docker network (`db-data-net`)
- Creates a persistent volume for MySQL data (`db_data`)
- Runs database migrations automatically on container startup

Once started successfully, you should see logs from both containers.

---

## 🌐 Accessing the Application

After the containers are running, open your browser and navigate to:

👉 **[http://localhost:8088](http://localhost:8088)**

The application should be available and connected to the MySQL database.

---

## 🧪 Verify Running Containers

To check that all containers are running:

```bash
docker-compose ps
```

You should see both services (`app` and `mysql`) with status **Up**.

---

## 🛑 How to Stop the Containers

To stop all running containers:

```bash
docker-compose down
```

### Notes:

- This stops and removes containers
- The **MySQL data is preserved** because it is stored in a Docker volume (`db_data`)

---

## 🔄 Stop and Remove Containers + Volumes (Clean Reset)

If you want to remove **all data**, including the database:

```bash
docker-compose down -v
```

⚠️ **Warning:** This will permanently delete all MySQL data.

---

## 📜 View Logs

To view logs from all services:

```bash
docker-compose logs
```

To follow logs in real time:

```bash
docker-compose logs -f
```

---

## 🧹 Optional Cleanup

Remove unused Docker resources:

```bash
docker system prune
```

---

## ✅ Summary

- Start containers: `docker-compose up --build`
- Access app: `http://localhost:8088`
- Stop containers: `docker-compose down`
- Full reset: `docker-compose down -v`

---

Happy coding 🚀
