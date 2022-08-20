terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0.1"
    }

  }
}

provider "azurerm" {
  features {}
}

provider "github" {
  token = var.github_token #"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"
  owner = var.github_owner #"armenmelkonyan90"
}
provider "helm" {
  kubernetes {
    config_path = "config"

  }
}
# provider "kubernetes" {

#   config_context = var.cluster_name
# }
