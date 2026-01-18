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

# Встановлюємо netcat-openbsd (він стабільніший та підтримує команду nc)
RUN apt-get update && apt-get install -y netcat-openbsd && rm -rf /var/lib/apt/lists/*

COPY --from=builder /app .

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Робимо скрипт виконуваним
RUN chmod +x /app/wait-for-it.sh


EXPOSE 8080

# Run database migrations and start the Django application
ENTRYPOINT ["./wait-for-it.sh", "mysql", "python manage.py migrate --noinput && python manage.py runserver 0.0.0.0:8080"]
