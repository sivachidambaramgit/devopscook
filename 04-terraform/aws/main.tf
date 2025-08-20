
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # Configure your backend here (uncomment & fill)
  # backend "s3" {
  #   bucket = "your-tf-state-bucket"
  #   key    = "devops-portfolio/aws/terraform.tfstate"
  #   region = "us-east-1"
  #   dynamodb_table = "your-tf-locks"
  #   encrypt = true
  # }
}

provider "aws" {
  region = var.region
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 20.0"
  cluster_name    = var.cluster_name
  cluster_version = "1.29"

  vpc_id     = "vpc-xxxxxxxx"    # replace
  subnet_ids = ["subnet-xxxxxx"] # replace

  eks_managed_node_groups = {
    default = {
      instance_types = var.node_instance_types
      min_size       = 1
      max_size       = 3
      desired_size   = 1
    }
  }
}

output "cluster_name" { value = module.eks.cluster_name }
output "cluster_endpoint" { value = module.eks.cluster_endpoint }
