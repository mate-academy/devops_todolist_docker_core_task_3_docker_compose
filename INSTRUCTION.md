## Setup and Run the TODO App Locally

Follow these steps to clone, build (if needed), and run the TODO app on your local machine.

---

## 1. Clone the Repository

1. Open your terminal.
2. Clone the GitHub repo:

```bash
  git clone git@github.com:ZhAlexR/devops_todolist_docker_core_task_3_docker_compose.git
```
3. Navigate into the project directory:

```bash
  cd devops_todolist_docker_core_task_3_docker_compose
```
---

## 2. (Optional) Pull Pre-built Docker Images

If you prefer to use pre-built images from Docker Hub instead of building locally, pull the following:

- **[todoapp](https://hub.docker.com/repository/docker/olzhu95/todoapp/general)**
```bash
  docker pull olzhu95/todoapp:3.0.0
```
- **[mysql-local](https://hub.docker.com/repository/docker/olzhu95/mysql-local/general)**
```bash
  docker pull olzhu95/mysql-local:2.0.0
```

> **Note:** Skip this section if you want to build images locally.

---

## 3. Build Docker Images (If You Didn’t Pull)

If you skipped pulling images or want to rebuild:

```bash
   docker-compose build
```

---

## 4. Start the Application

Launch the app and its dependencies in detached mode:

```bash
   docker-compose up -d
```

Once the services are running, open your browser and visit:

```
http://127.0.0.1:8080/
```

---

## 5. Stop and Remove Containers

When you’re done, shut down the application and clean up:

```bash
  docker-compose down
```

