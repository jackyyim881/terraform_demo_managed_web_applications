variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Location for the resources"
}

variable "sql_server_name" {
  description = "Name of the SQL Server"
}

variable "sql_server_version" {
  description = "Version of the SQL Server"
}

variable "sql_server_admin_login" {
  description = "Username for the SQL Server administrator"
}

variable "sql_server_admin_password" {
  description = "Password for the SQL Server administrator"
}

variable "sql_database_name" {
  description = "Name of the SQL Database"
}

variable "sql_database_edition" {
  description = "Edition of the SQL Database"
}

variable "sql_database_collation" {
  description = "Collation for the SQL Database"
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
}
