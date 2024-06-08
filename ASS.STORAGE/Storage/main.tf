resource "azurerm_resource_group" "rgname" {
  for_each = var.savari
  name     = each.value.resource_group_name
  location = each.value.location
}


resource "azurerm_storage_account" "mystorage" {
  for_each                 = var.savari
  name                     = each.value.name
  resource_group_name      = azurerm_resource_group.rgname[each.key].name
  location                 = azurerm_resource_group.rgname[each.key].location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type


}