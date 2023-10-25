resource "azurerm_mssql_server" "example_db" {
  name                         = var.SQLservername
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version             = var.sqlserverversion
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  minimum_tls_version          = var.minimum_tls_version

  tags = {
    environment = var.environment
  }

  dynamic "azuread_administrator" {
    for_each = var.enable_azuread_administrator ? [1] : []
    content {
      login_username                    = var.enable_azuread_administrator.null
      object_id                         = var.enable_azuread_administrator.null  
    }
  }
}
resource "azurerm_private_endpoint" "db-private-endpoint" {
  name                = var.priviteendpointname
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet2id

  private_service_connection {
    is_manual_connection           = false
    name                           = "server-resources"
    private_connection_resource_id = azurerm_mssql_server.example_db.id
    subresource_names              = ["sqlServer"]
  }
}