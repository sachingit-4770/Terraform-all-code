resource "azurerm_resource_group" "rgname" {
    for_each = var.rgvari
  name     = each.value.name
  location = each.value.locatio
}

