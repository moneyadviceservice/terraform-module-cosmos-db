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
  endpoint                           = var.endpoint
  access_key_metadata_writes_enabled = var.enable_access_key_metadata_writes
  automatic_failover_enabled         = var.enable_automatic_failover
  backup {
    interval_in_minutes = 240
    retention_in_hours  = 8
    storage_redundancy  = "Geo"
    type                = "Periodic"
  }

  geo_location {
    failover_priority = 0
    location          = var.location
    zone_redundant    = false
  }
  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  geo_location {
    location          = var.location
    failover_priority = 1
  }
}