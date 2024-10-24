resource "azurerm_cosmosdb_sql_container" "this" {
  for_each = var.containers

  name                   = each.value.container_name
  resource_group_name    = var.resource_group_name
  account_name           = azurerm_cosmosdb_account.this.name
  database_name          = each.value.db_name
  partition_key_path     = each.value.partition_key_path
  partition_key_version  = each.value.partition_key_version != null ? each.value.partition_key_version : 2
  throughput             = each.value.container_max_throughput != null ? null : each.value.container_throughout
  default_ttl            = each.value.default_ttl != null ? each.value.default_ttl : null
  analytical_storage_ttl = each.value.analytical_storage_ttl != null ? each.value.analytical_storage_ttl : null
  dynamic "autoscale_settings" {
    for_each = each.value.container_max_throughput != null ? [1] : []
    content {
      max_throughput = each.value.container_max_throughput
    }
  }

  dynamic "indexing_policy" {
    for_each = length(each.value.indexing_policy_settings) > 0 ? [1] : []
    content {
      indexing_mode = each.value.indexing_policy_settings.sql_indexing_mode != null ? each.value.indexing_policy_settings.sql_indexing_mode : null

      dynamic "included_path" {
        for_each = each.value.indexing_policy_settings.sql_included_path != null ? [1] : []
        content {
          path = each.value.indexing_policy_settings.sql_included_path
        }
      }
      dynamic "excluded_path" {
        for_each = each.value.indexing_policy_settings.sql_excluded_path != null ? [1] : []
        content {
          path = each.value.indexing_policy_settings.sql_excluded_path
        }
      }
    }
  }
  dynamic "unique_key" {
    for_each = length(each.value.sql_unique_key) > 0 ? each.value.sql_unique_key : []
    content {
      paths = each.value.sql_unique_key
    }
  }

  depends_on = [
    azurerm_cosmosdb_sql_database.this
  ]
}
