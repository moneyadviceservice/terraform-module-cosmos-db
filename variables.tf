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

# variable "db_name" {
#   type        = string
#   description = "The name of the Cosmos DB SQL Database"
# }
# variable "container_name" {
#   type    = string
#   default = "container1"
# }

# variable "throughput" {
#   type    = number
#   default = 400
# }

# variable "partition_key_paths" {
#   type    = list(string)
#   default = []
# }

# variable "indexing_mode" {
#   type    = string
#   default = "consistent"
# }

# variable "included_path" {
#   type    = list(string)
#   default = []
# }

# variable "excluded_path" {
#   type    = list(string)
#   default = []
# }

# variable "unique_key_paths" {
#   type    = list(string)
#   default = []
# }

variable "databases" {
  type = map(object({
    database_name = string
    containers = map(object({
      container_name      = string
      partition_key_paths = list(string)
      included_path       = list(string)
      excluded_path       = list(string)
      unique_key_paths    = list(string)
      throughput          = number
      indexing_mode       = string
    }))
  }))
}
