resource "azurerm_cosmosdb_sql_database" "this" {
  for_each            = var.databases
  name                = each.value.database_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.this.name
}