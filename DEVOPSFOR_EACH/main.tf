resource "azurerm_resource_group" "rg1" {
    for_each = var.storage_accounts
  name  = each.value.resource_group
  location = each.value.location
}


resource "azurerm_storage_account" "storage_accounts" {
  for_each = var.storage_accounts

  name                     = each.key
  resource_group_name      = azurerm_resource_group.rg1[each.key].name
  location                 = azurerm_resource_group.rg1[each.key].location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

  account_kind = "StorageV2"
}
