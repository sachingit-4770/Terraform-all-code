resource "azurerm_resource_group" "RG1" {
  for_each = var.RG_GROUP
  name     = each.value.name
  location = each.value.location
}
resource "azurerm_storage_account" "stg0001" {
    for_each = var.sa
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type


}