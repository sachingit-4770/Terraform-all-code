resource "azurerm_recovery_services_vault" "vault" {
  for_each            = var.RSV
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku
  storage_mode_type   = "LocallyRedundant"

  soft_delete_enabled = true
}

resource "azurerm_backup_policy_vm" "Policy-rsv" {
  name                = "mynewRSV-policy"
  resource_group_name = "LINUX"
  recovery_vault_name = "mynewRSV"
  
  backup {
    frequency = "Daily"
    time      = "23:00"
  }
  retention_daily {
    count = 10
  }
}
resource "azurerm_backup_protected_vm" "LINUXVM" {
  resource_group_name = "LINUX"
  recovery_vault_name = "mynewRSV"
  source_vm_id        = "/subscriptions/dfebe681-aef0-468c-abc7-67690a6617de/resourceGroups/LINUX/providers/Microsoft.Compute/virtualMachines/NewrsvVM"
  backup_policy_id    = azurerm_backup_policy_vm.Policy-rsv.id
}


