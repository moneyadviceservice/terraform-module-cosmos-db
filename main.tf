resource "random_integer" "this" {
  min = 10000
  max = 99999
}

resource "azurerm_cosmosdb_account" "this" {
  name                = "${var.name}-${random_integer.this.result}"
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = var.offer_type #"Standard"
  kind                = var.kind       #"MongoDB"

  automatic_failover_enabled = true

  capabilities {
    name = "EnableAggregationPipeline"
  }

  capabilities {
    name = "mongoEnableDocLevelTTL"
  }

  capabilities {
    name = "MongoDBv3.4"
  }

  capabilities {
    name = "EnableMongo"
  }

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  geo_location {
    location          = var.location
    failover_priority = 1
  }

  geo_location {
    location          = "westus"
    failover_priority = 0
  }
}