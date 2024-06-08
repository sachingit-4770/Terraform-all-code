VNET-NAME = {
  vnet01 = {

    name                = "VNET-A"
    location            = "eastus"
    resource_group_name = "RG_A"
    address_space       = ["10.0.0.0/21"]
  }
    vnet02 = {

    name                = "VNET-B"
    location            = "westus"
    resource_group_name = "RG_B"
    address_space       = ["10.0.0.0/24"]
  }
    vnet03 = {

    name                = "VNET-C"
    location            = "westeurope"
    resource_group_name = "RG_C"
    address_space       = ["10.0.0.0/24"]
  }
}