data "azurerm_subnet" "subnetid" {
  for_each             = var.NIC-CARD1
  name                 = each.value.name-subnet
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}