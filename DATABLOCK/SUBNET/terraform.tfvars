SUBNET = {
  SUB001 = {
    name                 = "Subnet-A"
    address_prefixes     = ["10.0.0.0/28"]
    resource_group_name  = "RG_A"
    virtual_network_name = "VNET-A"
  }
  SUB002 = {
    name                 = "Subnet-B"
    address_prefixes     = ["10.0.0.0/28"]
    resource_group_name  = "RG_B"
    virtual_network_name = "VNET-B"
  }
  SUB003 = {
    name                 = "Subnet-C"
    address_prefixes     = ["10.0.0.0/28"]
    resource_group_name  = "RG_C"
    virtual_network_name = "VNET-C"
  }
  SUB004 = {
    name                 = "AzureBastionSubnet"
    address_prefixes     = ["10.0.1.0/26"]
    resource_group_name  = "RG_A"
    virtual_network_name = "VNET-A"
  }
}