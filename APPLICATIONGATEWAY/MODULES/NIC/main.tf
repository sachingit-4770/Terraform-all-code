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
resource "azurerm_network_security_group" "nsg" {
  for_each = var.nic_map
  name                = each.value.nsg-name
  location            = each.value.location
  resource_group_name = each.value.rg-name

  security_rule {
    name                       = "MYNSG"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }


}

resource "azurerm_network_interface_security_group_association" "nsgass" {
  for_each = var.nic_map
  depends_on = [ azurerm_network_interface.NIC, azurerm_network_security_group.nsg ]
  network_interface_id      = data.azurerm_network_interface.datanic[each.key].id
  network_security_group_id = data.azurerm_network_security_group.datansg[each.key].id
}