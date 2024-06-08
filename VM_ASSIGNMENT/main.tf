terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.96.0"
    }
  }
}

provider "azurerm" {
  features {

  }
}
variable "bhaijaan" {
  type = string
  description = "this is my first variable use"
}
variable "location_ddo" {
  type = string
  description = "this is my first variable use"

}

resource "azurerm_resource_group" "resourcegroup1" {
  name     = var.bhaijaan
  location = var.location_ddo
}

