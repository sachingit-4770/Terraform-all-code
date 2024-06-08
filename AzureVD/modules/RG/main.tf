resource "azurerm_resource_group" "RG" {
    for_each = var.rg_map
  name = each.value.rg-name
  location= each.value.location
}