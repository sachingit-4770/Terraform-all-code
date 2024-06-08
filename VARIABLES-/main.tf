terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.96.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}
variable "sumit" {
  description = "this is for RG name"
  type = string
}
  

resource "azurerm_resource_group" "mysachinrg" {
  name     = "var.sumit"
  location = "West Europe"
}

