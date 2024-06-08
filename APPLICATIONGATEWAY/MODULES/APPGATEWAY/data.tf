data "azurerm_subnet" "datasubnet" {
  for_each             = var.ag_map
  name                 = each.value.subnet-name
  resource_group_name  = each.value.rg-name
  virtual_network_name = each.value.vnet-name
}
data "azurerm_public_ip" "datapip" {
  for_each             = var.ag_map
  depends_on           = [azurerm_public_ip.pip]
  name                 = each.value.pip-name
  resource_group_name  = each.value.rg-name

}
