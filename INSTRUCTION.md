## Docker Compose

## Create and start the containers:
Ensure the docker-compose.yml file is in the same directory where the commands are executed.

Run the following command to create and start all services defined in the docker-compose.yml file:
```bash
docker-compose up -d
```
you can start the server on http://localhost:8000

To stop all running containers and remove them you should use command:

```bash
docker-compose down
```
If a persistent volume is configured (e.g., for MySQL data), the data will not be removed when the containers are stopped. To remove volumes as well (caution: this deletes all data stored in the volumes), use:

docker-compose down -v
