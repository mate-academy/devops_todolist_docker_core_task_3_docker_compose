1. Fork the Repository

Go to the original repository on GitHub.

Click the "Fork" button in the top-right corner.

Clone your forked repository to your local machine:

git clone <YOUR_FORKED_REPO_URL>
cd Django-Todolist

2. Install and Run with Docker

Make sure you have Docker and Docker Compose installed.

Run the application:

docker-compose up -d --build

The -d flag runs containers in detached mode.

The --build flag ensures images are rebuilt if needed.

Access the application:

Open your browser and go to:

http://localhost:8000

The API can be accessed at:

http://localhost:8000/api/

3. Stop the Containers

To stop and remove containers, use:

docker-compose down

4. Access the MySQL Database

To connect to the MySQL database inside the container:

docker exec -it todolist_db mysql -uuser -ppassword todolist

5. Data Persistence

Task data is stored in a persistent volume (mysql_data).

The volume ensures that the database is not lost when containers are restarted.

6. Troubleshooting

If you encounter any issues:

Check logs with:

docker-compose logs -f

Restart the containers:

docker-compose down && docker-compose up -d --build

Now your Django-Todolist app is up and running with Docker! 🚀

