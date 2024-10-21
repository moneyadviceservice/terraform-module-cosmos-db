variable "env" {
  type = string
}

variable "name" {
  type = string
}

variable "location" {
  type    = string
  default = "UK South"
}

variable "resource_group_name" {
  type = string
}

variable "offer_type" {
  type = string
}

variable "kind" {
  type = string

}

variable "endpoint" {
  type = string
}

variable "enable_access_key_metadata_writes" {
  type    = bool
  default = true
}

variable "enable_automatic_failover" {
  type    = bool
  default = false
}

variable "consistency_level" {
  default = "Session"
}
