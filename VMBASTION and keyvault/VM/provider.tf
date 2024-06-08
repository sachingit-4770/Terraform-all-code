terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.100.0"
    }
  }
}
provider "azurerm" {
 features {
   
 }
}
resource "random_password" "example" {
  length  = 16
  special = true
  lower   = true
  upper   = true
  numeric = true
}

