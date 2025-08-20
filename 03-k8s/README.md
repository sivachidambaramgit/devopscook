
# 03-k8s — Helm chart

Deploy the demo app with health checks, HPA, and optional Ingress.

```bash
helm install demoapp 03-k8s/demoapp-chart -n demo --create-namespace   --set image.repository=ghcr.io/<OWNER>/<REPO>   --set image.tag=latest
```
