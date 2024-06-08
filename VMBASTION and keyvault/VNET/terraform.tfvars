rgmap = {
  RG1 = {
   
    location                 = "eastus"
    vnet_name                = "Putinvnet2"
    address_space            = ["10.0.0.0/24"]
    subnet_name              = "putinsubnet1"
    resource_group_name      = "Putinrg1"

    address_prefixes         = ["10.0.0.128/26"]
    address_prefixes_bastion = ["10.0.0.0/26"]
    bastionsubnet_name       = "AzureBastionSubnet"
  }
}