
# 04-terraform — Cloud skeletons

This folder contains **skeletons** for deploying a managed Kubernetes cluster on AWS/GCP/Azure using community modules. You must supply credentials, set up a remote backend, and review costs.

## Layout
- `modules/` — shared variables/examples
- `aws/` — EKS example using `terraform-aws-modules/eks`
- `gcp/` — GKE example using `terraform-google-modules/kubernetes-engine`
- `azure/` — AKS example using `Azure/aks` module

> NOTE: These are minimal, not production-ready. Add VPC/VNet, IAM, and node pool settings per your needs.

## Example (AWS)
```bash
cd aws
terraform init
terraform apply
```

## Remote state
- AWS: S3 + DynamoDB
- GCP: GCS bucket
- Azure: Azure Blob + storage account
