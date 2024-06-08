resource "azurerm_network_interface" "NIC" {
    for_each = var.nic_map
    name = each.value.nic-name
    location = each.value.location
    resource_group_name = each.value.rg-name
    
    ip_configuration {
      name = "internal"
      private_ip_address_allocation = "Dynamic"
      subnet_id = data.azurerm_subnet.datasubnet[each.key].id
    }
  
}