
resource "azurerm_resource_group" "nana-rg" {
  for_each = var.RGSA
  name     = each.value.resource_group_name
  location = each.value.location
}
resource "azurerm_storage_account" "nana-storage" {
  for_each = var.RGSA
  name                     = each.value.name_Storage
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on = [ azurerm_resource_group.nana-rg ]
}

