# Stage 1: Build Stage
ARG PYTHON_VERSION=3.8
FROM python:${PYTHON_VERSION} as builder

WORKDIR /app
COPY . .

# Stage 2: Run Stage
FROM python:${PYTHON_VERSION} as run

WORKDIR /app
ENV PYTHONUNBUFFERED=1

# Install netcat for DB readiness check
RUN apt-get update && apt-get install -y netcat-openbsd && rm -rf /var/lib/apt/lists/*

COPY --from=builder /app .

RUN pip install --upgrade pip && pip install -r requirements.txt

EXPOSE 8000

ENTRYPOINT ["sh", "-c", "while ! nc -z $DB_HOST $DB_PORT; do sleep 2; done; python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
