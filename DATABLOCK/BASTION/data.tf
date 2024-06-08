data "azurerm_public_ip" "publicdata" {
  name                = "newpip"
  resource_group_name = "RG_A"

}
data "azurerm_subnet" "datasubnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = "RG_A"
  virtual_network_name = "VNET-A"
}