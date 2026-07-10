## Start the application
To build and run the application in the background, execute the following command:
```bash
docker-compose up --build -d
```

The application will be available at:

http://localhost:8080/

http://127.0.0.1:8080/

API endpoint: http://localhost:8080/api/

## Useful commands

To check the status of your running containers, use:
```Bash
docker-compose ps
```

To view the logs of your application (useful for debugging), use:
```Bash
docker-compose logs
```

## Stop the application
To gently stop and remove the containers (your database volume will persist), execute:

```Bash
docker-compose down
```

