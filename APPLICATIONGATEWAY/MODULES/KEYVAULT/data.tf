data "azurerm_client_config" "current" {}


data "azurerm_key_vault" "datakv" {
    depends_on = [ azurerm_key_vault.MYKV ]
    for_each = var.kv_map
name = each.value.kv-name
resource_group_name = each.value.rg-name
}