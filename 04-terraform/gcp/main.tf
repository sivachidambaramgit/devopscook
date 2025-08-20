
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
  # backend "gcs" {
  #   bucket = "your-tf-state-bucket"
  #   prefix = "devops-portfolio/gcp"
  # }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  version = "~> 32.0"

  project_id = var.project_id
  name       = var.cluster_name
  region     = var.region
  zones      = [var.zone]

  network    = "default" # replace
  subnetwork = "default" # replace
}

output "cluster_name" { value = module.gke.name }
