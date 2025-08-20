
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "rg-tfstate"
  #   storage_account_name = "yourstorageacct"
  #   container_name       = "tfstate"
  #   key                  = "devops-portfolio/azure/terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
}

module "aks" {
  source  = "Azure/aks/azurerm"
  version = "~> 9.0"

  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_name        = var.cluster_name
  kubernetes_version  = "1.29.0"
  system_node_count   = 1
}

output "cluster_name" { value = module.aks.aks_name }
