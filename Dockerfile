# Stage 1: Build Stage
ARG PYTHON_VERSION=3.8
FROM python:${PYTHON_VERSION} as builder
# Set the working directory
WORKDIR /app
COPY . .

# Stage 2: Run Stage
FROM python:${PYTHON_VERSION} as run

WORKDIR /app

ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y --no-install-recommends netcat-openbsd && rm -rf /var/lib/apt/lists/*


COPY --from=builder /app .

RUN pip install --upgrade pip && \
    pip install -r requirements.txt


EXPOSE 8080

# Run database migrations and start the Django application
ENTRYPOINT ["sh", "-c", "while ! nc -z $DB_HOST $DB_PORT; do echo waiting for db; sleep 10; done; python manage.py migrate && python manage.py runserver 0.0.0.0:8080"]