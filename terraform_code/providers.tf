terraform {
  required_version = ">= 1.3"
  backend "local" {  
    path = /home/ubuntu/actions-runner/_work/terraform_apim/terraform_apim/terraform_code
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
