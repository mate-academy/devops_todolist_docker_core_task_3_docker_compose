## Running the Containers
To start all services defined in `docker-compose.yml`, run:

```bash
docker-compose up -d
```
- The Python app will be accessible at: [http://localhost:8080](http://localhost:8080)

## Stopping the Containers
To stop the running containers without removing them:

```bash
docker-compose stop
```

To stop and remove containers, networks, and volumes:

```bash
docker-compose down
```

If you also want to remove named volumes (`db-data` in this case):

```bash
docker-compose down -v
```