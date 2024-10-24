
resource "azurerm_cosmosdb_sql_container" "this" {
  for_each              = { for db_key, db_value in var.databases : db_key => db_value }
  name                  = each.value.containers[container_name].container_name
  resource_group_name   = var.resource_group_name
  account_name          = azurerm_cosmosdb_account.this.name
  database_name         = azurerm_cosmosdb_sql_database.this[each.key].name
  partition_key_paths   = each.value.containers[container_name].partition_key_paths
  partition_key_version = 1
  throughput            = each.value.containers[container_name].throughput

  indexing_policy {
    indexing_mode = each.value.containers[container_name].indexing_mode

    dynamic "included_path" {
      for_each = each.value.containers[container_name].included_path
      content {
        path = included_path.value
      }
    }

    dynamic "excluded_path" {
      for_each = each.value.containers[container_name].excluded_path
      content {
        path = excluded_path.value
      }
    }
  }

  dynamic "unique_key" {
    for_each = each.value.containers[container_name].unique_key_paths
    content {
      paths = [unique_key.value]
    }
  }
}