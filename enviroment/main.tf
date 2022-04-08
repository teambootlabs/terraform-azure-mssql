data "azurerm_resource_group" "terraboot" {
  name = "terrabootlabs"
}

resource "azurerm_private_dns_zone" "example" {
  name                = "example.mysql.database.azure.com"
  resource_group_name = data.azurerm_resource_group.terraboot.name
}

data "azurerm_virtual_network" "terraboot" {
  name                = "terrabootlabs"
  resource_group_name = "terrabootlabs"
}

resource "azurerm_private_dns_zone_virtual_network_link" "example" {
  name                  = "exampleVnetZone.com"
  private_dns_zone_name = azurerm_private_dns_zone.example.name
  virtual_network_id    = data.azurerm_virtual_network.terraboot.id
  resource_group_name   = data.azurerm_resource_group.terraboot.name
}

resource "azurerm_mysql_flexible_server" "test" {
  name                   = "example-mysql-flexible-server"
  resource_group_name    = data.azurerm_resource_group.terraboot.name
  location               = var.location
  administrator_login    = var.mssql_server_administraxtion_login
  administrator_password = var.mssql_server_administraxtion_login_password
}
resource "azurerm_mysql_flexible_database" "mssql" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.terraboot.name
  server_name         = azurerm_mysql_flexible_server.test.name
  charset             = var.charset
  collation           = var.collation
}