
from fastapi import FastAPI
from prometheus_client import Counter, generate_latest, CONTENT_TYPE_LATEST
from starlette.responses import Response

app = FastAPI(title="devops-portfolio demoapp")

hits = Counter('demoapp_http_requests_total', 'Total HTTP requests', ['endpoint'])

@app.get("/")
def root():
    hits.labels(endpoint="/").inc()
    return {"message": "Hello from devops-portfolio demoapp"}

@app.get("/healthz")
def healthz():
    hits.labels(endpoint="/healthz").inc()
    return {"status": "ok"}

@app.get("/livez")
def livez():
    hits.labels(endpoint="/livez").inc()
    return {"alive": True}

@app.get("/metrics")
def metrics():
    data = generate_latest()
    return Response(content=data, media_type=CONTENT_TYPE_LATEST)
