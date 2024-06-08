resource "azurerm_public_ip" "PUBLICIP1" {
  for_each            = var.bast
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion-host" {
  depends_on          = [azurerm_public_ip.PUBLICIP1]
  for_each            = var.bast
  name                = each.value.name-bastion
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.datasubnet.id
    public_ip_address_id = data.azurerm_public_ip.publicdata.id
  }
}