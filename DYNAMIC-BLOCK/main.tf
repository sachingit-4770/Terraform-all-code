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

  dynamic "subnet" {
    for_each = each.value.subnets
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
    }

  }
}
  