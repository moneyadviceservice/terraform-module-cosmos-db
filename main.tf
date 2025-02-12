resource "azurerm_cosmosdb_account" "this" {
  name                               = var.name
  location                           = var.location
  resource_group_name                = var.resource_group_name
  offer_type                         = var.offer_type
  kind                               = var.kind
  access_key_metadata_writes_enabled = var.enable_access_key_metadata_writes
  automatic_failover_enabled         = var.enable_automatic_failover
  is_virtual_network_filter_enabled  = var.virtual_network_filter_enabled
  backup {
    interval_in_minutes = var.backup_interval
    retention_in_hours  = var.backup_retention
    storage_redundancy  = "Geo"
    type                = "Periodic"
  }

  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = var.consistency_level == "BoundedStaleness" ? 300 : null
    max_staleness_prefix    = var.consistency_level == "BoundedStaleness" ? 100000 : null
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

  dynamic "virtual_network_rule" {
    for_each = var.subnet_id != null ? [1] : []
    content {
      id = var.subnet_id
    }
  }
  dynamic "capabilities" {
    for_each = var.capability != null ? [var.capability] : []
    content {
      name = var.capability
    }
  }

  analytical_storage {
    schema_type = var.analytical_storage_schema
  }
}