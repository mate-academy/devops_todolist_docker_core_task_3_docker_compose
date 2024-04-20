<!-- Running with Docker Compose
To start the application and MySQL database, use the following commands: -->
docker-compose up -d
<!-- This will build and start the containers in the background. The application will be accessible at http://localhost:8000.
To stop the containers, run: -->

docker-compose down
<!-- This will stop and remove the containers. Use the -v option if you want to remove the volume data as well: -->
docker-compose down -v
