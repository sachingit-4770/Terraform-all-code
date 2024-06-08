terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.96.0"
    }
  }
   backend "azurerm" {
    resource_group_name  = "testing"
    storage_account_name = "jaimahakalimaaji"
    container_name       = "vhds"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    
  }
}
resource "azurerm_resource_group" "testing" {
  name     = "testing"
  location = "West Europe"
}

resource "azurerm_storage_account" "jaimahakalimaaji" {
  name                     = "jaimahakalimaaji"
  resource_group_name      = "testing"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "container" {
  name                  = "vhds"
  storage_account_name  = "jaimahakalimaaji"
  container_access_type = "private"
}
resource "azurerm_resource_group" "testing2024" {
  name     = "testing2024"
  location = "West Europe"
}
resource "azurerm_resource_group" "testing2025" {
  name     = "testing2025"
  location = "West Europe"
}