resource "azurerm_mssql_database" "example" {
  name         = var.mssql_database_name
  server_id    = var.mssql_server_id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = var.max_size_gb
  sku_name     = "S0"
  enclave_type = "VBS"

}