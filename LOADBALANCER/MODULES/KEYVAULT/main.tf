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

    access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]
  }
}
resource "azurerm_key_vault_secret" "user" {
  depends_on = [ azurerm_key_vault.MYKV ]
  for_each = var.kv_map
  name         = each.value.user-name
  value        = each.value.user-value
  key_vault_id = data.azurerm_key_vault.datakv[each.key].id
}
resource "azurerm_key_vault_secret" "pass" {
  depends_on = [ azurerm_key_vault.MYKV ]
  for_each = var.kv_map
  name         = each.value.password-name
  value        = each.value.pass-value
  key_vault_id = data.azurerm_key_vault.datakv[each.key].id
}