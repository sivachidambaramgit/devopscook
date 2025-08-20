
# 01-docker — Demo Service

A minimal FastAPI service with health & metrics endpoints, packaged via a multi-stage Dockerfile and running as a non-root user.

## Run locally
```bash
docker build -t devops-portfolio/demoapp:local .
docker run --rm -p 8080:8080 devops-portfolio/demoapp:local
curl -s localhost:8080/ | jq
curl -s localhost:8080/healthz
```

## Endpoints
- `/` – hello payload
- `/healthz` – readiness
- `/livez` – liveness
- `/metrics` – Prometheus metrics (via prometheus-client)
