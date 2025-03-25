# 📌 TodoApp Docker Compose Instructions

This document provides instructions on how to download, run, and use the `todoapp` with mySQL server Docker container from Docker Hub.

## 1️⃣ Prerequisites

Ensure that you have Docker installed on your system. If not, you can download and install it from:  
[https://www.docker.com/get-started](https://www.docker.com/get-started)

---

## 2️⃣ Pull the Docker Image

To download the latest version of the `todoapp` image from Docker Hub, run:  

```sh
docker pull amylnikova/todoapp:2.0.0
```

---

## 3️⃣ Running the Docker Compose

To run Docker containers for app and server, run:

```sh
docker-compose up -d
```

- `-d` runs the container in detached mode (in the background). 

## 4️⃣ Access the Application

After running the container, open your browser and go to:

```sh
http://localhost:8000
```

## 5️⃣ Stopping the Containers

To stop and remove Docker Containers for both app and server, run:

```sh
docker-compose down
```
This will stop and remove containers from your machine