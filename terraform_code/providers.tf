terraform {
  backend "local" {
    path = "/home/ubuntu/actions-runner/terraform/terraform_apim/terraform_apim/terraform_code/.terraform/terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
}
}
provider "azurerm" { 
  features {}  
}
