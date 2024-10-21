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
  default = "UK South"
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

variable "endpoint" {
  type        = string
  description = "The endpoint used to connect to the CosmosDB account."
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
