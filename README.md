# Django-Todolist

Django-Todolist is a todolist web application with the most basic features of most web apps, i.e. accounts/login, API and (somewhat) interactive UI.

---
CSS | [Skeleton](http://getskeleton.com/)
JS  | [jQuery](https://jquery.com/)

In this project, I have created a compose file to automate Docker builds for the app and the db.

## Explore

To run your todo app locally you should install Docker, it should be supplied with Docker compose, if not, please install it separately.

Then, using the terminal, navigate with cd command to the downloaded folder and simply run:

```
docker compose up
```
Add -d flag to run it detached.

To stop the container you should execute following command from the same folder:

```
docker compose down
```
