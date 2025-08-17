
# syntax=docker/dockerfile:1

# -------- Build stage --------
FROM python:3.11-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -U pip && pip wheel --no-cache-dir --wheel-dir /wheels -r requirements.txt

# -------- Runtime stage --------
FROM python:3.11-slim
ENV PYTHONUNBUFFERED=1 UVICORN_WORKERS=1
RUN useradd -u 10001 -m appuser
WORKDIR /app
COPY --from=builder /wheels /wheels
RUN pip install --no-cache-dir /wheels/* && rm -rf /wheels
COPY . .
USER 10001
EXPOSE 8080
HEALTHCHECK --interval=15s --timeout=3s CMD wget -qO- http://127.0.0.1:8080/healthz || exit 1
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8080"]
