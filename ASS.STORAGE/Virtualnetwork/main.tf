
resource "azurerm_virtual_network" "virtaulnet" {
  for_each            = var.VNETvari
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space

}

resource "azurerm_subnet" "subnet" {
  for_each             = var.SUBNETVari
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
  depends_on           = [azurerm_virtual_network.virtaulnet]
}