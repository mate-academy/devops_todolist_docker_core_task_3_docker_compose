# ToDo App — Docker Instructions

## Docker Hub

App image repository: [artemzakharchukhome/todoapp](https://hub.docker.com/repository/docker/artemzakharchukhome/todoapp/general)

MySQL image repository: [artemzakharchukhome/mysql-local](https://hub.docker.com/repository/docker/artemzakharchukhome/mysql-local/general)

## Build the images

From the project root directory:

```bash
docker compose up
```

## Stop containers

From the project root directory:

```bash
docker compose down
```

## Access the application in a browser

After both containers are running, open:

- Landing page: [http://localhost:8080/](http://localhost:8080/)
- API: [http://localhost:8080/api/](http://localhost:8080/api/)
