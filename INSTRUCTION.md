To run the dockercompose file you firstly need images:

todoapp:2.0.0   with python application
mysql-local:1.0.0    with mysql database

for them you can run:

docker-compose build

to run docker-compose containers you should run:

docker-compose up

with parameter -d to start it detached


and to stop docker-compose containers you should run:

docker-compose down