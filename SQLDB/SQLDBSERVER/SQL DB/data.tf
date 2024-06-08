data "azurerm_mssql_server" "sqlserverdata" {
  for_each            = var.dbmap
  name                = each.value.name_data
  resource_group_name = each.value.resource_group_name
  
}