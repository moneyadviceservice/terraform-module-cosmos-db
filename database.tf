resource "azurerm_cosmosdb_sql_database" "this" {
  for_each            = var.databases
  name                = each.value.db_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.this.name
  throughput          = each.value.db_max_throughput != null ? null : each.value.db_throughput

  dynamic "autoscale_settings" {
    for_each = each.value.db_max_throughput != null ? [1] : []
    content {
      max_throughput = each.value.db_max_throughput
    }
  }
}