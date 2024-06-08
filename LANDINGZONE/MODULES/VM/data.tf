data "azurerm_network_interface" "datanic"{
    for_each = var.vm_map
    name = each.value.nic-name
    resource_group_name = each.value.rg-name
}
data "azurerm_key_vault" "datakv" {
    for_each = var.vm_map
    name = each.value.kv-name
    resource_group_name = each.value.rg-name
  
}
data "azurerm_key_vault_secret" "datausr"{
    for_each = var.vm_map
    name = "username"
    key_vault_id =  data.azurerm_key_vault.datakv[each.key].id
}
data "azurerm_key_vault_secret" "datapass"{
    for_each = var.vm_map
    name = "password"
    key_vault_id =  data.azurerm_key_vault.datakv[each.key].id
}