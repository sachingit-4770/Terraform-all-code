data "azurerm_subnet" "datasubnet"{
    for_each = var.nic_map
    name = each.value.subnet-name
    resource_group_name= each.value.rg-name
    virtual_network_name = each.value.vnet-name
}