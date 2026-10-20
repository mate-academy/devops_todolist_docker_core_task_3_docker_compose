To run and stop containers with docker-compose, follow these steps:

Build and start the containers in the background:

Bash
docker-compose up --build -d
Open your browser and navigate to:

Plaintext
http://localhost:8000
To stop the containers while preserving your database data:

Bash
docker-compose down