to start:

docker-compose run

to stop:

ctrl + C
+
docker-compose down

#### Requirements

1. Prepare a docker-compose file that will build and start both MySQL db and Todolist app
2. Remove RUN python manage.py migrate as the database is no longer available at the build time
3. Refactor ENTRYPOINT to execute both db migration and application start. Example:
`ENTRYPOINT ["sh", "-c", “command1 && command2”]`
4. The application should work with no issues after running docker-compose up
5. Update the README.md file by adding a new section with instructions on how to run and stop containers with docker-compose
6. Todos should be stored in MySQL Database, with a persistent volume connected
7. Create PR with your changes and attach it for validation on a platform








