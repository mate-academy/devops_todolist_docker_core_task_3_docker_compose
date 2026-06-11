For prerequisites:
pip install -r requirements.txt

For database initialization:
python manage.py migrate
python manage.py runserver 0.0.0.0:8080

For clear all cash:
docker system prune -a

For run containers:
docker-compose up -d

For look status containers:
docker-compose ps

For start containers:
docker-compose start
docker-compose restart

For stop containers:
docker-compose stop

For something goes wrong:
docker-compose ps
docker-compose logs
docker exec -it <container-name> sh

For stop all containers and delete:
docker-compose down