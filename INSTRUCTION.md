# Instructions to Run MySQL and App Containers


## Running MySQL Container with Volume Attached
```bash
docker-compose --env-file .env up --build

```

## Stopping App Container with Volume Attached
```bash
docker-compose down
```
## Accessing the Application

Open your browser and go to: http://localhost:8000