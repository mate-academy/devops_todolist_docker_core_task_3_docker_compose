ARG PYTHON_VERSION=3.11-slim
FROM python:${PYTHON_VERSION}

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# міграцію під час білду прибираємо — бази ще немає
# RUN python manage.py migrate   <-- видалено

EXPOSE 8000

ENTRYPOINT ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]