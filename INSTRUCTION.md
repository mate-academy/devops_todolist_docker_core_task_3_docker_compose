1) Run docker-compose by the command below
```shell
docker-compose up --build -d
```
2) If necessary, rerun django container:
```shell
docker restart django_app
```
3) Access the server via localhost:8080
4) Stop the docker-compose by the command below:
```shell
docker-compose down
```