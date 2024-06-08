resource "azurerm_resource_group" "RG" {
  for_each = var.rgmap
  name     = each.value.resource_group_name
  location = each.value.location

}
resource "azurerm_virtual_network" "VNET" {
  depends_on          = [azurerm_resource_group.RG]
  for_each            = var.rgmap
  name                = each.value.vnet_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space

}
resource "azurerm_subnet" "subnet" {
  depends_on = [ azurerm_resource_group.RG, azurerm_virtual_network.VNET ]

  for_each             = var.rgmap
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes

}
resource "azurerm_subnet" "bastionsubnet" {
  depends_on = [ azurerm_resource_group.RG,azurerm_virtual_network.VNET ]

  for_each             = var.rgmap
  name                 = each.value.bastionsubnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes_bastion

}