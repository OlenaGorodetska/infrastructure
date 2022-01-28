terraform {
  required_version = ">= 0.13"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 1.32"
    }
  }
}

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "example-org-535ac9"

    workspaces {
      prefix = "infrastructure-"
    }
  }
}