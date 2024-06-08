resource "azurerm_network_interface" "NIC" {
    for_each = var.linuxmap
    name = each.value.nic_name
    location = each.value.location
    resource_group_name = each.value.resource_group_name

    ip_configuration {
      name  ="internal"
      subnet_id = data.azurerm_subnet.datasubnet.id
    private_ip_address_allocation = "Dynamic"
       
          }
  
}

resource "azurerm_linux_virtual_machine" "linuxvm" {
    depends_on = [ azurerm_network_interface.NIC, azurerm_key_vault_secret.password ]
    for_each = var.linuxmap
    name = each.value.vm-name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    size = each.value.size
    admin_username = each.value.admin_username
    admin_password = data.azurerm_key_vault_secret.sachin.value
    disable_password_authentication = false
    network_interface_ids = [azurerm_network_interface.NIC[each.key].id]

  os_disk {
        caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer = "0001-com-ubuntu-server-jammy"
    sku = "22_04-lts"
    version   = "latest"
  }
}
resource "azurerm_public_ip" "pip" {
    for_each = var.linuxmap
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion" {
    for_each = var.linuxmap
    depends_on = [ azurerm_public_ip.pip ]
  name                = "putinbastion"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.bastion.id
    public_ip_address_id = azurerm_public_ip.pip[each.key].id
  }
}


resource "azurerm_key_vault_secret" "password" {
  name         = "vmpassword"
  value        = random_password.password.result
  key_vault_id = data.azurerm_key_vault.keyvault.id
}
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}