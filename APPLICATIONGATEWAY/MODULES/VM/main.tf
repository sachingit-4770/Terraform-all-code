resource "azurerm_linux_virtual_machine" "LINUXVM" {
  depends_on = [ azurerm_availability_set.avset ]
    for_each = var.vm_map
  name = each.value.vm-name
  resource_group_name = each.value.rg-name
  location = each.value.location
  size = "Standard_F2"
  admin_username = data.azurerm_key_vault_secret.datausr[each.key].value
  admin_password = data.azurerm_key_vault_secret.datapass[each.key].value
  disable_password_authentication =false
  availability_set_id = data.azurerm_availability_set.dataset[each.key].id
  network_interface_ids =[data.azurerm_network_interface.datanic[each.key].id]
  
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
resource "azurerm_availability_set" "avset" {
 
  for_each = var.vm_map
  name                = each.value.avset-name
  location            = each.value.location
  resource_group_name = each.value.rg-name


}