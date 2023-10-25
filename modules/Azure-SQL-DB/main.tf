resource "azurerm_mssql_database" "test" {
  name           = var.sqlservername
  server_id      = var.sqlserver_id
  license_type   = var.license_type
  max_size_gb    = var.max_size_gb
  read_scale     = var.read_scale
  sku_name       = var.sku_name
  zone_redundant = var.zone_redundant

  tags = {
    environment = var.environment
  }
}