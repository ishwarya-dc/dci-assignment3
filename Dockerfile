FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

ENV PORT=8080

# MUST use shell form so $PORT expands
CMD exec gunicorn --bind 0.0.0.0:$PORT app:app
