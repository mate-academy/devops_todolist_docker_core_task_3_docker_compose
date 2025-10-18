Ensure that the docker-compose.yml file is located at the same level as the docker files.

This docker-compose launches two containers, first mysql, then todoapp. If necessary, you can change the ports for the host machine in the file. (ONLY FOR THE HOST MACHINE). 

To start compose, use the command: 

docker compose up -d   (-d will run in the background, i.e., it will not control the terminal)

To stop compose, use the command:

docker compose down


Also check the todolist/settings.py file, line 69, to make sure that host is specified as the container name