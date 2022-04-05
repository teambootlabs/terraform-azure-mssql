
variable "mssql_server_administraxtion_login" {
  description = "Login user id for the mssql database server."
  type        = string
}

variable "mssql_server_administraxtion_login_password" {
  description = "Password of the luser to login to the mssql server."
  type        = string
}

variable "mssql_databse_name" {
  description = "The name of the Ms SQL Database. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "Location of the database to be created."
  type        = string
}

variable "mssql_database_auto_pause_delay_in_minutes" {
  description = "Time in minutes after which database is automatically paused."
  type        = string
}

variable "mssql_database_create_mode" {
  description = "The create mode of the database."
  type        = string
}

variable "mssql_database_creation_source_database_id" {
  description = "The ID of the source database from which to create the new database."
  type        = string
}

variable "mssql_database_collation" {
  description = "Specifies the collation of the database."
  type        = string
}

variable "mssql_database_elastic_pool_id" {
  description = "Specifies the ID of the elastic pool containing this database."
  type        = string
}

variable "mssql_database_name" {
  description = "The name of the Ms SQL Database."
  type        = string
}

variable "mssql_database_extended_auditing_policy_storage_account_access_key_is_secondary" {
  description = "Specifies whether storage_account_access_key value is the storage's secondary key."
  type        = string
}

variable "mssql_database_extended_auditing_policy_retention_in_days" {
  description = "Specifies the number of days to retain logs for in the storage account."
  type        = string
}

variable "mssql_database_extended_auditing_policy_log_monitoring_enabled" {
  description = "To enable audit events to Log Analytics, please refer to the example which can be found in the ./examples/sql-azure/sql_auditing_log_analytics directory within the Github Repository."
  type        = bool
}

variable "mssql_database_geo_backup_enabled" {
  description = "A boolean that specifies if the Geo Backup Policy is enabled."
  type        = string
}

variable "mssql_database_license_type" {
  description = "Specifies the license type applied to this database. "
  type        = string
}

variable "mssql_database_long_term_retention_policy_weekly_retention" {
  description = "The weekly retention policy for an LTR backup in an ISO 8601 format."
  type        = string
}

variable "mssql_database_long_term_retention_policy_monthly_retention" {
  description = "The monthly retention policy for an LTR backup in an ISO 8601 format."
  type        = string
}

variable "mssql_database_long_term_retention_policy_yearly_retention" {
  description = "The yearly retention policy for an LTR backup in an ISO 8601 format."
  type        = string
}

variable "mssql_database_long_term_retention_policy_week_of_year" {
  description = "The week of year to take the yearly backup. "
  type        = number
}

variable "mssql_database_max_size_gb" {
  description = "The max size of the database in gigabytes."
  type        = number
}

variable "mssql_database_min_capacity" {
  description = "Minimal capacity that database will always have allocated, if not paused."
  type        = number
}

variable "mssql_database_restore_point_in_time" {
  description = "pecifies the point in time  of the source database that will be restored to create the new database."
  type        = string
}

variable "mssql_database_recover_database_id" {
  description = "The ID of the database to be recovered. "
  type        = string
}

variable "mssql_database_restore_dropped_database_id" {
  description = "The ID of the database to be restored."
  type        = string
}

variable "mssql_database_read_replica_count" {
  description = "The number of readonly secondary replicas associated with the database to which readonly application intent connections may be routed."
  type        = string
}

variable "mssql_database_read_scale" {
  description = "If enabled, connections that have application intent set to readonly in their connection string may be routed to a readonly secondary replica."
  type        = string
}

variable "mssql_database_sample_name" {
  description = "Specifies the name of the sample schema to apply when creating this database."
  type        = string
}

variable "mssql_database_short_term_retention_policy_retention_days" {
  description = "Point In Time Restore configuration. "
  type        = number
}

variable "mssql_database_sku_name" {
  description = "Specifies the name of the SKU used by the database."
  type        = string
}

variable "mssql_database_storage_account_type" {
  description = "Specifies the storage account type used to store backups for this database."
  type        = string
}

variable "mssql_database_threat_detection_policy" {
  description = "Threat detection policy configuration."
  type        = string
}

variable "mssql_database_zone_redundant" {
  description = "Whether or not this database is zone redundant, which means the replicas of this database will be spread across multiple availability zones."
  type        = bool
}

variable "mssql_database_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
}

variable "mssql_database_threat_detection_policy_state" {
  description = "The State of the Policy. "
  type        = string
}

variable "mssql_database_threat_detection_policy_disabled_alerts" {
  description = " Specifies a list of alerts which should be disabled."
  type        = set(string)
}

variable "mssql_database_threat_detection_policy_email_account_admins" {
  description = "Should the account administrators be emailed when this alert is triggered"
  type        = string
}

variable "mssql_database_threat_detection_policy_email_addresses" {
  description = "A list of email addresses which alerts should be sent to."
  type        = set(string)
}

variable "mssql_database_threat_detection_policy_retention_days" {
  description = "Specifies the number of days to keep in the Threat Detection audit logs."
  type        = string
}

variable "mssql_database_threat_detection_policy_storage_account_access_key" {
  description = "Specifies the identifier key of the Threat Detection audit storage account."
  type        = string
}

variable "mssql_database_threat_detection_policy_storage_endpoint" {
  description = "Specifies the blob storage endpoint"
  type        = string
}
