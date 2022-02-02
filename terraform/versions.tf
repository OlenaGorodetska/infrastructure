terraform {
  required_version = ">= 1.1.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.91.0"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "example-org-535ac9"

    workspaces {
      prefix = "infrastructure-"
    }
  }
}