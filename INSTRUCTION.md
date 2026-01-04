Create docker-compose.yml;
Change "HOST" value in todolist/settings.py: "{ip}" -> "mysql"
Delete "RUN python manage.py migrate" in Dockerfile;
Change on "ENTRYPOINT ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8080"]" in Dockerfile;
Run command docker-compose ud -d
Go to localhost:8080 in your browser