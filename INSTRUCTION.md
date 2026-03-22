# 🚀 Todo App with Docker Compose

## 📦 Run the project

Build and start all containers:

```bash
docker-compose up --build
```

## 🌐 Access the application

Open in your browser:

http://localhost:8080

## 🛑 Stop containers
```bash
docker-compose down
```

## 💾 Database persistence
MySQL uses a Docker volume:
```
db-data
```

All data will be preserved even after containers are stopped or removed.

## 🔄 Rebuild the project

If you made changes to the code or configuration:

```bash
docker-compose down
docker-compose up --build
```

## ⚠️ Notes
- Database migrations are executed automatically when the application container starts
- The application waits until MySQL is ready before starting
- Make sure port 8080 is available on your machine

