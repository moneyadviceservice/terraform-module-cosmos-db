resource "azurerm_cosmosdb_sql_container" "this" {
  for_each              = var.container_name != null ? [var.container_name] : []
  name                  = var.container_name
  resource_group_name   = var.resource_group_name
  account_name          = azurerm_cosmosdb_account.this.name
  database_name         = azurerm_cosmosdb_sql_database.this.name
  partition_key_paths   = var.partition_key_paths
  partition_key_version = 1
  throughput            = var.throughput

  indexing_policy {
    indexing_mode = var.indexing_mode

    dynamic "included_path" {
      for_each = var.included_path
      content {
        path = included_path.value
      }
    }

    dynamic "excluded_path" {
      for_each = var.excluded_path
      content {
        path = excluded_path.value
      }
    }
  }

  unique_key {
    paths = var.unique_key_paths
  }
}
