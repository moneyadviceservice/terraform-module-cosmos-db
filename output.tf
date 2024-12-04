output "cosmosdb_account_id" {
  value = azurerm_cosmosdb_account.this.id
}

output "cosmosdb_account_endpoint" {
  value = azurerm_cosmosdb_account.this.endpoint
}

output "cosmosdb_account_primary_key" {
  value = azurerm_cosmosdb_account.this.primary_key
}
