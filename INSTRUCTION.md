#environment for DB-Connection
- DB_NAME=
- DB_USER=
- DB_PASSWORD=
- DB_HOST=
#start service 
docker compose -f .\docker-compose.yml up -d
#stop service
docker compose -f .\docker-compose.yml down
#url
http://localhost:8080
#logs
docker compose logs -f app/app
docker compose logs -f app/mysql