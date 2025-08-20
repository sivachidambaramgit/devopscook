
# 02-ci-cd — Pipeline notes

This repo uses GitHub Actions (see `.github/workflows/`) to:
1) Build and push the Docker image to GHCR
2) Scan the image with Trivy (fail on HIGH/CRITICAL)
3) Optionally deploy to Kubernetes via Helm on tagged releases

Secrets you need:
- `GHCR_PAT` (if not using `${{ github.token }}`) — or rely on `GITHUB_TOKEN` for GHCR
- `KUBE_CONFIG` or OIDC workflow to your cloud (for `kubectl`/`helm` deploys)
- `SLACK_WEBHOOK` for Alertmanager (observability project)
