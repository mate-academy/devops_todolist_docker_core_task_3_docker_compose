start containers: 
    docker-compose up -d
stop containers: 
    docker-compose down (stopped and remover containers)

We use volumes "db-data" that means you can delete containers, images and you will have not any impact to your data, because it is stored on the machine level