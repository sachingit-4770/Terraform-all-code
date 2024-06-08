resource "azurerm_virtual_network" "VNET" {
    for_each = var.vnet_map
  name = each.value.vnet-name
  location = each.value.location
  resource_group_name = each.value.rg-name
  address_space = each.value.address-space
}