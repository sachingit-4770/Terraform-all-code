VNETvari = {
  # Vnet1 = { 
  #   name = "frontendvnet"
  #   location            = "centralindia"
  #   resource_group_name = "frontend-rg"
  #   address_space       = ["10.0.0.0/16"]
  # },
    Vnet1 = { 
    name = "RSVVNET"
    location            = "eastus"
    resource_group_name = "LINUX"
    address_space       = ["10.0.0.0/16"]
  }
 
}
SUBNETVari = {
#   SubnetA = {
#     name                 = "forntend-subnet"
#     resource_group_name  = "frontend-rg"
#     virtual_network_name = "frontendvnet"
#     address_prefixes     = ["10.0.1.0/24"]
#   },
#   SubnetB = {
#     name                 = "bakend-subnet"
#     resource_group_name  = "backend-rg"
#     virtual_network_name = "backendvnet"
#     address_prefixes     = ["10.0.1.0/24"]
#   },
   SubnetC = {
    name                 = "RSVVMSUBNET"
    resource_group_name  = "LINUX"
    virtual_network_name = "RSVVNET"
    address_prefixes     = ["10.0.1.0/28"]
  },
}
