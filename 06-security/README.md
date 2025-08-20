
# 06-security

Security scaffolding for the portfolio:
- **Trivy**: container image and filesystem scanning
- **Checkov**: static analysis for Terraform/Kubernetes manifests
- **.trivyignore**: example allowlist for noisy CVEs (review carefully before using)

Also see `.github/workflows/security.yml` for CI integration.
