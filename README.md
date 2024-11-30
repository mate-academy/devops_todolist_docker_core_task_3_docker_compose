# Django-Todolist

Django-Todolist is a todolist web application with the most basic features of most web apps, i.e. accounts/login, API and (somewhat) interactive UI.

---
CSS | [Skeleton](http://getskeleton.com/)
JS  | [jQuery](https://jquery.com/)

## Explore
Try it out by installing the requirements. (Works only with python >= 3.8, due to Django 4)

    pip install -r requirements.txt

Create a database schema:

    python manage.py migrate

And then start the server (default: http://localhost:8000)

    python manage.py runserver


Now you can browse the [API](http://localhost:8000/api/)
or start on the [landing page](http://localhost:8000/)

## Task
#### Prerequisites
- Fork this repository

#### Requirements

1. Prepare a `docker-compose.yml` file that will build and start both MySQL db and Todolist app
2. Remove RUN python manage.py migrate as the database is no longer available at the build time
3. Refactor ENTRYPOINT to execute both db migration and application start. Example:
`ENTRYPOINT ["sh", "-c", “command1 && command2”]`
4. The application should work with no issues after running docker-compose up
5. Create the `INSTRUCTION.md` file with detailed instructions on how to run and stop containers with docker-compose
6. Todos should be stored in MySQL Database, with a persistent volume connected
7. Create PR with your changes and attach it for validation on a platform


---

---

---


**In this task i made following changes in the files:** 

1. **Firstly I ammended Dockerfile**

    to run 2 shell commands on container start using ENTRYPOINT exec form:

    ```sh
    ENTRYPOINT ["executable", "param1", "param2"]
    ENTRYPOINT ["sh", "-c" "python manage.py migrate && python manage.py runserver 0.0.0.0:8080"]
    ```

    where:

    * **​`sh`​**: The shell executable.
    *  **​`-c`​**: Instructs the shell to execute the following string as a command.
    *  **​`"python manage.py migrate && python manage.py runserver 0.0.0.0:8080"`​** : The actual command string to be executed by the shell, which chains two Python commands together.

    ---

    which could be achieved similarly with ENTRYPOINT shell form:

    ```sh
    ENTRYPOINT command1 && command2
    ENTRYPOINT python manage.py migrate && python manage.py runserver 0.0.0.0:8080
    ```

    however they say **Exec Form is Preferred for ENTRYPOINT**:
    The exec form (`["sh", "-c", "commands"]`) is more robust and behaves more predictably
2. **Secondly I ammended Database settings:** 

    parameter reffered to host address with the  database container name.
    As it is common practise to do in following cases:

    1. **Within a single Docker Compose project**: Containers that are launched within the scope of a single `docker-compose.yml` file can use service names to communicate with each other.
    2. **In custom user-defined networks**: If containers are connected to a shared user-defined network (created with `docker network create my_network`), they can also resolve each other by their names.

---

**instructions on how to run and stop containers with docker-compose**:

* **FIRSTLY:**  prepare docker-compose file containing all necessary sections,
  which can have either default docker-compose.yml / docker-compose.yaml name
  or custom name *.yml / *.yaml

  1. *default* docker-compose file start command

      `docker-compose up`
  2. *custom* name docker-compose file start command

      `docker-compose -f my-custom-compose.yml up`
* **SECONDLY:**  you can check the status of docker-compose managed containers with command:

  `docker-compose ps`

  *note: if you started docker-compose not in the --detached mode -&gt; use new terminal*
* **THIRDLY:**  you can see the logs of docker-compose managed containers with command:

  `docker-compose logs`
* **LASTLY:**  to stop & remove docker compose managed containers use command:

  `docker-compose down`
