ARG PYTHON_VERSION=3.10

# ---------- BUILD STAGE ----------
FROM python:${PYTHON_VERSION} AS builder

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --prefix=/install -r requirements.txt

COPY . .

# ---------- RUN STAGE ----------
FROM python:${PYTHON_VERSION}-slim

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY --from=builder /install /usr/local
COPY --from=builder /app .

EXPOSE 8080

ENTRYPOINT ["sh", "-c", "python -c 'from app import db; db.create_all()' && python app.py"]