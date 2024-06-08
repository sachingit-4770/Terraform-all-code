resource "azurerm_storage_account" "STG" {
  for_each                 = var.stg_map
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  tags = each.value.tag
  dynamic "network_rules" {
    for_each = contains(keys(each.value), "networkrule") ? each.value.networkrule : {}
    content {
      default_action = network_rules.value
    }
  }

 
}








#var.a != "" ? var.a : "default-a"















































resource "azurerm_resource_group" "RG" {
  name     = "RG-CE"
  location = "eastus"

}

