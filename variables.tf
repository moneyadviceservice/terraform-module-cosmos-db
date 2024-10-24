variable "env" {
  type        = string
  description = "The environment to deploy to"
}

variable "name" {
  type        = string
  description = "The name of your function app"
}

variable "location" {
  type    = string
  default = "uksouth"
}

variable "secondary_location" {
  type    = string
  default = "ukwest"
}

variable "resource_group_name" {
  type        = string
  description = "The resource group your function app will be assigned to"
}

variable "offer_type" {
  type        = string
  description = "(Required) Specifies the Offer Type to use for this CosmosDB Account; currently, this can only be set to Standard."
  default     = "Standard"
}

variable "kind" {
  type        = string
  description = "(Optional) Specifies the Kind of CosmosDB to create"
  default     = "GlobalDocumentDB"

}

variable "enable_access_key_metadata_writes" {
  type        = bool
  description = "Optional) Is write operations on metadata resources (databases, containers, throughput) via account keys enabled?"
  default     = true
}

variable "enable_automatic_failover" {
  type        = bool
  description = "(Optional) Enable automatic failover for this Cosmos DB account."
  default     = false
}

variable "consistency_level" {
  type        = string
  description = "(Required) The Consistency Level to use for this CosmosDB Account"
  default     = "Session"
}

variable "capability" {
  type        = string
  description = "Configure capabilities to be enabled for this Cosmos DB account"
  default     = null
}

variable "backup_interval" {
  type        = number
  description = "The interval in minutes between two backups."
  default     = 240
}

variable "backup_retention" {
  type        = number
  description = "The time in hours that each backup is retained."
  default     = 8
}

variable "analytical_storage_schema" {
  type        = string
  description = "The schema type of the Analytical Storage for this Cosmos DB account."
  default     = "WellDefined"
}

variable "databases" {
  type = map(object({
    db_name           = string
    db_throughput     = number
    db_max_throughput = number
  }))
  description = "Map of Cosmos DB SQL DBs to create. Some parameters are inherited from cosmos account."
  default     = {}
}

variable "containers" {
  type = map(object({
    container_name           = string
    db_name                  = string
    partition_key_paths      = string
    partition_key_version    = number
    container_throughout     = number
    container_max_throughput = number
    default_ttl              = number
    analytical_storage_ttl   = number
    indexing_policy_settings = object({
      sql_indexing_mode = string
      sql_included_path = string
      sql_excluded_path = string
      composite_indexes = map(object({
        indexes = set(object({
          path  = string
          order = string
        }))
      }))
      spatial_indexes = map(object({
        path = string
      }))
    })
    sql_unique_key = list(string)
    conflict_resolution_policy = object({
      mode      = string
      path      = string
      procedure = string
    })
  }))
  description = "List of Cosmos DB SQL Containers to create. Some parameters are inherited from cosmos account."
  default     = {}
}