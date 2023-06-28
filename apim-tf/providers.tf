terraform {
  required_version = ">= 1.3"
  backend "azurerm" {
    resource_group_name  = "tfstate-files"
    storage_account_name = "tfstatefiles9"
    container_name       = "tfstate"
    key                  = "actions.tfstate"
  }

  required_providers {
    azurerm = {
      version = "~>3.2"
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}
