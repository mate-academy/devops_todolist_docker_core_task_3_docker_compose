# Running the Todolist App with Docker Compose

This guide explains how to build and run the Todolist application with Docker Compose, connecting it to a MySQL database with a persistent volume.

## Prerequisites
1. **Docker** and **Docker Compose** should be installed on your system. You can find installation instructions for Docker [here](https://docs.docker.com/get-docker/) and for Docker Compose [here](https://docs.docker.com/compose/install/).

2. Fork and clone the repository to your local machine.

## Getting Started

### Step 1: Build and Start the Containers
In the project root directory (where the `docker-compose.yml` is located), run the following command:

```bash
docker-compose up --build
