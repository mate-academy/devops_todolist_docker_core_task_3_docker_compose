# Instructions for Managing the Application via Docker Compose

This document provides detailed instructions on how to build, run, stop, and clean up the multi-container TodoList application using Docker Compose.

---

## Prerequisites

Before running the commands, ensure that:
1. **Docker Desktop** is installed and running on your machine.
2. You are located in the root directory of the project (where the `docker-compose.yml` file is located).
3. Ports `8080` (for the web application) and `3306` (for the MySQL database) are not occupied by other local services.

---

## 1. Launching the Application

To build the Docker images and start both the MySQL database and the Django application containers simultaneously in the background (detached mode), execute the following command:

```bash
docker-compose up -d --build
