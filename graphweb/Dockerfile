FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    NAME=World \
    REDIS_HOST=redis

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY app3.py ./

EXPOSE 8500

CMD ["gunicorn", "--bind", "0.0.0.0:8500", "app3:app"]
