data "azurerm_network_interface" "NICID" {
    for_each = var.linux-vms
  name                = each.value.name-nic
  resource_group_name = each.value.resource_group_name
}