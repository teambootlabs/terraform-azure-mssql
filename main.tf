resource "azurerm_resource_group" "mssql_resource_group" {
  name     = "mssql-resource-group"
  location = var.location
}

resource "azurerm_storage_account" "mssql_storage_class" {
  name                     = "storageaccount"
  resource_group_name      = azurerm_resource_group.mssql_resource_group.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_mssql_server" "mssql_server" {
  name                         = "mssql-databace-server"
  resource_group_name          = azurerm_resource_group.mssql_resource_group.name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.mssql_server_administraxtion_login
  administrator_login_password = var.mssql_server_administraxtion_login_password
}

resource "azurerm_management_lock" "rglock" {
  name       = "resource-group-level"
  scope      = azurerm_resource_group.mssql_resource_group.id
  lock_level = "ReadOnly"
  notes      = "This Resource Group is Read-Only"
}

resource "azurerm_mssql_database" "mssql_database" {

  name                        = var.mssql_database_name
  server_id                   = azurerm_mssql_server.mssql_server.id
  auto_pause_delay_in_minutes = var.mssql_database_auto_pause_delay_in_minutes
  create_mode                 = var.mssql_database_create_mode
  creation_source_database_id = var.mssql_database_creation_source_database_id
  collation                   = var.mssql_database_collation
  elastic_pool_id             = var.mssql_database_elastic_pool_id
  extended_auditing_policy {

    storage_account_access_key              = azurerm_storage_account.mssql_storage_class.primary_access_key
    storage_endpoint                        = azurerm_storage_account.mssql_storage_class.primary_blob_endpoint
    storage_account_access_key_is_secondary = var.mssql_database_extended_auditing_policy_storage_account_access_key_is_secondary
    retention_in_days                       = var.mssql_database_extended_auditing_policy_retention_in_days
    log_monitoring_enabled                  = var.mssql_database_extended_auditing_policy_log_monitoring_enabled


  }
  geo_backup_enabled = var.mssql_database_geo_backup_enabled
  license_type       = var.mssql_database_license_type
  long_term_retention_policy {
    weekly_retention  = var.mssql_database_long_term_retention_policy_weekly_retention
    monthly_retention = var.mssql_database_long_term_retention_policy_monthly_retention
    yearly_retention  = var.mssql_database_long_term_retention_policy_yearly_retention
    week_of_year      = var.mssql_database_long_term_retention_policy_week_of_year

  }
  max_size_gb                 = var.mssql_database_max_size_gb
  min_capacity                = var.mssql_database_min_capacity
  restore_point_in_time       = var.mssql_database_restore_point_in_time
  recover_database_id         = var.mssql_database_recover_database_id
  restore_dropped_database_id = var.mssql_database_restore_dropped_database_id
  read_replica_count          = var.mssql_database_read_replica_count
  read_scale                  = var.mssql_database_read_scale
  sample_name                 = var.mssql_database_sample_name
  short_term_retention_policy {
    retention_days = var.mssql_database_short_term_retention_policy_retention_days
  }
  sku_name             = var.mssql_database_sku_name
  storage_account_type = var.mssql_database_storage_account_type
  threat_detection_policy {
    state                      = var.mssql_database_threat_detection_policy_state
    disabled_alerts            = var.mssql_database_threat_detection_policy_disabled_alerts
    email_account_admins       = var.mssql_database_threat_detection_policy_email_account_admins
    email_addresses            = var.mssql_database_threat_detection_policy_email_addresses
    retention_days             = var.mssql_database_threat_detection_policy_retention_days
    storage_account_access_key = var.mssql_database_threat_detection_policy_storage_account_access_key
    storage_endpoint           = var.mssql_database_threat_detection_policy_storage_endpoint
  }
  zone_redundant = var.mssql_database_zone_redundant
  tags           = var.mssql_database_tags

}