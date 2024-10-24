resource "azurerm_cosmosdb_sql_database" "this" {
  for_each            = var.db_name != null ? [var.db_name] : []
  name                = var.db_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.this.name
  throughput          = 400
}