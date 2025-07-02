# Docker Compose Instructions

## Prerequisites
- Docker
- Docker Compose

## Running the Application

### Start the containers
```bash
docker-compose up
```

This command will:
1. Build the MySQL database container
2. Build the Django todolist application container
3. Start both services with proper dependencies
4. Run database migrations automatically
5. Start the Django development server

The application will be available at: http://localhost:8080

### Start containers in background (detached mode)
```bash
docker-compose up -d
```

### View logs
```bash
docker-compose logs
```

### View logs for specific service
```bash
docker-compose logs todolist
docker-compose logs mysql
```

## Stopping the Application

### Stop containers
```bash
docker-compose down
```

### Stop containers and remove volumes (WARNING: This will delete all data)
```bash
docker-compose down -v
```

## Data Persistence

The MySQL database data is stored in a Docker volume named `mysql_data`. This ensures that your todos will persist between container restarts. The data will only be lost if you explicitly remove the volume using `docker-compose down -v`.

## Troubleshooting

If you encounter issues:

1. Check if ports 8080 and 3306 are available
2. View logs: `docker-compose logs`
3. Rebuild containers: `docker-compose up --build`
4. Reset everything: `docker-compose down -v && docker-compose up --build`
