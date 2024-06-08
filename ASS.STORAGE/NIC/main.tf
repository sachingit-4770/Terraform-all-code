resource "azurerm_network_interface" "mynic" {
  for_each            = var.NICVari
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {

    name                          = "internal"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = "/subscriptions/dfebe681-aef0-468c-abc7-67690a6617de/resourceGroups/linux/providers/Microsoft.Network/publicIPAddresses/linuxvm-ip"
  }
  
}