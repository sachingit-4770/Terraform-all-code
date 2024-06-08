resource "azurerm_resource_group" "RG" {
  name     = "Dynamic-rg"
  location = "eastus"
}
resource "azurerm_virtual_network" "VNET" {
  for_each            = var.vnetmap
  name                = each.value.vnetname
  location            = each.value.location
  resource_group_name = each.value.rg-name
  address_space       = each.value.address-space

 

}
  resource "azurerm_virtual_network_peering" "vnet01"{
    for_each = var.vnetmap
    name = "db-vnet-db-vnet2"
    resource_group_name = each.value.rg-name
    virtual_network_name = "db-vnet"
    remote_virtual_network_id = data.azurerm_virtual_network.datavnet2.id
  }
   resource "azurerm_virtual_network_peering" "vnet02"{
    for_each = var.vnetmap
    name = "db-vnet2-db-vnet"
    resource_group_name = each.value.rg-name
    virtual_network_name = "db-vnet2"
    remote_virtual_network_id = data.azurerm_virtual_network.datavnet.id
  }