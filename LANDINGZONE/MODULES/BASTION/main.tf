resource "azurerm_public_ip" "bastionpip" {
    for_each = var.bas_map
    name = each.value.pip-name
    resource_group_name = each.value.rg-name
    location = each.value.location
    allocation_method = "Static"
    sku = "Standard"
  
}

resource "azurerm_bastion_host" "mybashost"{
    depends_on = [ azurerm_public_ip.bastionpip ]
    for_each = var.bas_map
    name = each.value.bastion-name
    resource_group_name = each.value.rg-name
    location = each.value.location
  
    ip_configuration {
        public_ip_address_id = azurerm_public_ip.bastionpip[each.key].id
      name = "baspip"
      subnet_id = data.azurerm_subnet.datasubnet[each.key].id
    }
}