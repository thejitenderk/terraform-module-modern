resource "azurerm_mssql_database" "mssql_database" {
  name                = var.mssql_database_name
  server_id           = var.mssql_server_id
  collation          = var.collation
  max_size_gb        = var.max_size_gb
  sku_name           = var.sku_name
  zone_redundant     = var.zone_redundant
  read_scale         = var.read_scale
  license_type       = var.license_type
  create_mode        = var.create_mode
  source_database_id = var.source_database_id

  tags = var.tags
  
}

