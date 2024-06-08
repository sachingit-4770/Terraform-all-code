data "azurerm_subnet" "datasubnet"{
    for_each = var.nic_map
    name = each.value.subnet-name
    resource_group_name= each.value.rg-name
    virtual_network_name = each.value.vnet-name
}
data "azurerm_network_interface" "datanic" {
    depends_on = [ azurerm_network_interface.NIC ]
    for_each = var.nic_map
    name = each.value.nic-name
    resource_group_name = each.value.rg-name
}
data "azurerm_network_security_group" "datansg" {
        depends_on = [ azurerm_network_security_group.nsg ]
    for_each = var.nic_map
    name = each.value.nsg-name
    resource_group_name = each.value.rg-name
}