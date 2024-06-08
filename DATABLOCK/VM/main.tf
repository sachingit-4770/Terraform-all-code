resource "azurerm_linux_virtual_machine" "MYLINUXVM" {
  for_each                        = var.linux-vms
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                   = each.value.admin_user
  admin_password                 = each.value.admin_password
  disable_password_authentication = "false"
  network_interface_ids = [
    data.azurerm_network_interface.NICID[each.key].id,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}