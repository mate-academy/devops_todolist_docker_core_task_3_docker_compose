# Run Django Todolist with Docker Compose

## Prerequisites

Open a terminal in the repository root, where `docker-compose.yml` is located. Start Docker Desktop on Windows or macOS, or start Docker Engine on Linux. Confirm that Compose is installed and that Docker can reach the engine.

```sh
docker compose version
docker info
```

`docker info` should show a `Server` section. If your installation provides the standalone `docker-compose` command, you can use `docker-compose` in place of `docker compose` throughout this guide.

## Build and start

Build the images and start both services in the background.

```sh
docker compose up --build -d
```

Compose waits for the `mysql` service to pass its health check before starting `app`. Django applies database migrations at startup and then starts the web server. The first build may take a few minutes while Docker downloads images and installs dependencies.

To run in the foreground and see both services' logs in the terminal, use `docker compose up --build`.

## Verify the services

```sh
docker compose ps
```

Check that `mysql` is `healthy` and `app` is `Up`, then open [Todolist](http://localhost:8080/).

To follow the application and database logs, run `docker compose logs -f app mysql`. Press `Ctrl+C` to exit the log view.

If Compose cannot connect to the Docker Engine, check that Docker Desktop or Docker Engine is running and try `docker info` again. If Compose reports a port conflict, free the host port named in the error. The default host ports are `8080` for Todolist and `3306` for MySQL.

## Stop or remove the containers

If you started Compose in the foreground, press `Ctrl+C` to stop both containers. For a background run, stop the containers from the repository root.

```sh
docker compose stop
```

Run `docker compose up -d` to start the project again. To stop and remove the containers and the Compose network, use the following command.

```sh
docker compose down
```

MySQL stores its data in the `db_data` volume. Compose reuses that volume the next time you start the project.
