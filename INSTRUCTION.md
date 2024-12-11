
# Running Containers
## To run docker-compose and start your containers, follow these steps:

 - Open Terminal.

 - Navigate to your project directory where the docker-compose.yml file is located.

Run the following command to start your containers:


 - docker-compose up  
This command will:

Build images (if necessary) based on the specified Dockerfile.
Start the defined services in detached mode.
To run in detached mode (background), add the -d flag:


 - docker-compose up -d  
This allows you to use your terminal for other commands while your containers are running.

View logs (if needed):
To see the logs from your running services, use:


 - docker-compose logs  
For logs from a specific service, specify the service name:


 - docker-compose logs web  
## Step 3: Stopping Containers
### You can stop your running containers with the following command:

 - Open Terminal.

 - Navigate to your project directory where the docker-compose.yml file is located.

Run the following command:


 - docker-compose down  
This command will:

Stop and remove all containers defined in the docker-compose.yml file.
Remove any networks created by docker-compose up.
If you want to stop the containers without removing them, you can use:


 - docker-compose stop  
This stops the containers but does not remove them, allowing you to start them again later without rebuilding.

### MySQL Database, with a persistent volume connected

