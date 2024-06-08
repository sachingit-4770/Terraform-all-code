resource "azurerm_resource_group" "RG1"{
for_each = var.RG-GROUP
    name = each.value.name
    location = each.value.location
}