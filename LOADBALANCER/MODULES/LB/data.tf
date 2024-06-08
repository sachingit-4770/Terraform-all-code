data "azurerm_public_ip" "datapip" {
    depends_on = [ azurerm_public_ip.frontend-pip ]
    for_each = var.lb_map
    name = each.value.pip-name
    resource_group_name = each.value.rg-name
}
data "azurerm_lb" "datalb" {
    depends_on = [ azurerm_lb.azure-lb ]
    for_each = var.lb_map
    name = each.value.lb-name
    resource_group_name = each.value.rg-name
}
data "azurerm_lb_backend_address_pool" "datapool"{
    for_each = var.lb_map
    depends_on = [ azurerm_lb_backend_address_pool.frontend-pool ]
    name = each.value.backend-name
    loadbalancer_id = data.azurerm_lb.datalb[each.key].id
}
data "azurerm_network_interface" "datanic1"{

    for_each = var.lb_map
    name = each.value.nic-name1
    resource_group_name = each.value.rg-name
}
data "azurerm_network_interface" "datanic2"{
    for_each = var.lb_map
    name = each.value.nic-name2
    resource_group_name = each.value.rg-name

}
