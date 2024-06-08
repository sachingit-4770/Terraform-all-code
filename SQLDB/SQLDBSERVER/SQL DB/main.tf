resource "azurerm_mssql_database" "nana-db" {
  for_each       = var.dbmap
  name           = each.value.name_sqldb
  server_id      = data.azurerm_mssql_server.sqlserverdata[each.key].id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 10
  read_scale     = false
  sku_name       = "S0"
  zone_redundant = false
  enclave_type   = "VBS"

}