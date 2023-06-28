terraform {
  required_version = ">= 1.3"
  backend "azurerm" {
    resource_group_name  = "tfstate-files"
    storage_account_name = "tfstatefiles9"
    container_name       = "tfstate"
    key                  = "actions.tfstate2"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "~>4.0"
    }
  }
}

provider "azurerm" {
  features {}
}
