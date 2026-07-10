## Start the application
To build and run the application in the background, execute the following command:
```bash
docker-compose up --build -d
```

The application will be available at:

http://localhost:8080/

http://127.0.0.1:8080/

## Stop the application
To gently stop and remove the containers (your database volume will persist), execute:

```Bash
docker-compose down
```