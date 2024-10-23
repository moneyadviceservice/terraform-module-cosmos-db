resource "random_integer" "this" {
  min = 10000
  max = 99999
}

resource "azurerm_cosmosdb_account" "this" {
  name                               = "${var.name}-${random_integer.this.result}"
  location                           = var.location
  resource_group_name                = var.resource_group_name
  offer_type                         = var.offer_type
  kind                               = var.kind
  access_key_metadata_writes_enabled = var.enable_access_key_metadata_writes
  automatic_failover_enabled         = var.enable_automatic_failover
  backup {
    interval_in_minutes = var.backup_interval
    retention_in_hours  = var.backup_retention
    storage_redundancy  = "Geo"
    type                = "Periodic"
  }

  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  geo_location {
    failover_priority = 0
    location          = var.location
    zone_redundant    = false
  }

  geo_location {
    location          = var.secondary_location
    failover_priority = 1
  }

  capabilities {
    name = var.capability
  }

  analytical_storage {
    schema_type = var.analytical_storage_schema
  }
}