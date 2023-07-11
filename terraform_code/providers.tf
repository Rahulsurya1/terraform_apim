terraform {
  backend "local" {
    path = terraform_apim/terraform_apim/terraform_code
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
