resource "azurerm_key_vault" "MYKV" {
    for_each = var.kv_map
  name = each.value.kv-name
  resource_group_name = each.value.rg-name
  location =each.value.location
  tenant_id = data.azurerm_client_config.current.tenant_id
sku_name = "standard"
enabled_for_disk_encryption = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
}