## How to run the application with Docker Compose

1. Check .env file for MySQL credentials and update if necessary.

2. Validate the Docker Compose configuration:

```bash
docker compose config
```

3. Start the application with Docker Compose:

```bash
docker compose up --build -d
```

4. The application should be available at http://localhost:8080/ and the API at http://localhost:8080/api/

5. To stop the application, run:

```bash
docker compose down
```

6. To view logs of the application, run:

```bash
docker compose logs -f
```