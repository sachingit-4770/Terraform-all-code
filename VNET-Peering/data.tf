data "azurerm_virtual_network" "datavnet"{
    name = "db-vnet"
    resource_group_name = "Dynamic-RG"
}
data "azurerm_virtual_network" "datavnet2"{
    name = "db-vnet2"
    resource_group_name = "Dynamic-RG"
}