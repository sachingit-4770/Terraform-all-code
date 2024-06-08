resource "azurerm_resource_group" "RG1" {
  name     = "RG001"
  location = "West Europe"
}

resource "azurerm_virtual_network" "VNET1" {
  name                = "VNET001"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.RG1.location
  resource_group_name = azurerm_resource_group.RG1.name
}

resource "azurerm_subnet" "SUBNET1" {
  name                 = "SUBNET001"
  resource_group_name  = azurerm_resource_group.RG1.name
  virtual_network_name = azurerm_virtual_network.VNET1.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "NIC1" {
  name                = "NIC001"
  location            = azurerm_resource_group.RG1.location
  resource_group_name = azurerm_resource_group.RG1.name

  ip_configuration {
    name                          = "NIC001"
    subnet_id                     = azurerm_subnet.SUBNET1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "VM2" {

  name                            = "VM006"
  resource_group_name             = azurerm_resource_group.RG1.name
  location                        = azurerm_resource_group.RG1.location
  size                            = "Standard_F2"
  admin_username                  = "sachin"
  admin_password                  = "Sachin@123456"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.NIC1.id,

  ]

  boot_diagnostics {
    storage_account_uri = "yadavjjeetu0000123456"
  }

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
resource "azurerm_managed_disk" "Jeetu01" {
  name                 = "Data-jeetu"
  location             = azurerm_resource_group.RG1.location
  resource_group_name  = azurerm_resource_group.RG1.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "32"

}
resource "azurerm_virtual_machine_data_disk_attachment" "Disk001" {
  depends_on         = [azurerm_managed_disk.Jeetu01]
  managed_disk_id    = azurerm_managed_disk.Jeetu01.id
  virtual_machine_id = "/subscriptions/dfebe681-aef0-468c-abc7-67690a6617de/resourceGroups/RG001/providers/Microsoft.Compute/virtualMachines/VM006"
  lun                = "10"
  caching            = "ReadWrite"
}
resource "azurerm_network_security_group" "NSG1" {
  name                = "NSG001"
  location            = azurerm_resource_group.RG1.location
  resource_group_name = azurerm_resource_group.RG1.name

  security_rule {
    name                       = "test123"
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

resource "azurerm_subnet_network_security_group_association" "VMassociation" {
  depends_on                = [azurerm_network_security_group.NSG1]
  subnet_id                 = azurerm_subnet.SUBNET1.id
  network_security_group_id = azurerm_network_security_group.NSG1.id
}
resource "azurerm_network_interface_security_group_association" "Nicasso" {
  depends_on                = [azurerm_network_security_group.NSG1]
  network_interface_id      = azurerm_network_interface.NIC1.id
  network_security_group_id = azurerm_network_security_group.NSG1.id

}
resource "azurerm_storage_account" "stg0001" {
  name                     = "yadavjjeetu0000123456"
  resource_group_name      = azurerm_resource_group.RG1.name
  location                 = azurerm_resource_group.RG1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"


}
