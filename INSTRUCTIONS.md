### Running the Containers
To start all services defined in `docker-compose.yml`, run:

```bash
docker-compose up -d
```
And navigate to: [http://localhost:8080](http://localhost:8080)

### Stopping the Containers
To stop the running containers without removing them:

```bash
docker-compose stop
```

To stop and remove containers, networks, and volumes:

```bash
docker-compose down
```
