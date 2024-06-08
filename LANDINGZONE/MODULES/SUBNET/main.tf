resource "azurerm_subnet" "SUBNET" {
    for_each = var.subnet_map
    name = each.value.subnet-name
    resource_group_name = each.value.rg-name
    virtual_network_name = each.value.vnet-name
    address_prefixes = each.value.address-prefix
  
}