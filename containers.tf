resource "azurerm_cosmosdb_sql_container" "this" {
  for_each = {
    for db_key, db_value in var.databases :
    db_key => db_value.containers
  }

  name                = each.value.container_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.this.name
  database_name       = azurerm_cosmosdb_sql_database[each.key].name
  partition_key_paths = each.value.partition_key_paths
  throughput          = each.value.throughput

  indexing_policy {
    indexing_mode = each.value.indexing_mode

    dynamic "included_path" {
      for_each = each.value.included_path
      content {
        path = included_path.value
      }
    }

    dynamic "excluded_path" {
      for_each = each.value.excluded_path
      content {
        path = excluded_path.value
      }
    }
  }

  unique_key {
    paths = each.value.unique_key_paths
  }
}
