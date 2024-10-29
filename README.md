# terraform-module-cosmos-db
A Terraform module for the creation of [Cosmos DB Accounts](https://learn.microsoft.com/en-us/azure/cosmos-db/).

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_cosmosdb_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) | resource |
| [azurerm_cosmosdb_sql_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_container) | resource |
| [azurerm_cosmosdb_sql_database.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_database) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_analytical_storage_schema"></a> [analytical\_storage\_schema](#input\_analytical\_storage\_schema) | The schema type of the Analytical Storage for this Cosmos DB account. | `string` | `"WellDefined"` | no |
| <a name="input_backup_interval"></a> [backup\_interval](#input\_backup\_interval) | The interval in minutes between two backups. | `number` | `240` | no |
| <a name="input_backup_retention"></a> [backup\_retention](#input\_backup\_retention) | The time in hours that each backup is retained. | `number` | `8` | no |
| <a name="input_capability"></a> [capability](#input\_capability) | Configure capabilities to be enabled for this Cosmos DB account | `string` | `null` | no |
| <a name="input_consistency_level"></a> [consistency\_level](#input\_consistency\_level) | (Required) The Consistency Level to use for this CosmosDB Account | `string` | `"Session"` | no |
| <a name="input_containers"></a> [containers](#input\_containers) | List of Cosmos DB SQL Containers to create. Some parameters are inherited from the Cosmos account. | <pre>map(object({<br>    container_name           = string<br>    db_name                  = string<br>    partition_key_paths      = list(string)<br>    partition_key_version    = number<br>    container_throughout     = number<br>    container_max_throughput = number<br>    default_ttl              = number<br>    analytical_storage_ttl   = number<br>    indexing_policy_settings = object({<br>      indexing_mode = string<br>      included_path = string<br>      excluded_path = string<br>      composite_indexes = map(object({<br>        indexes = set(object({<br>          path  = string<br>          order = string<br>        }))<br>      }))<br>      spatial_indexes = map(object({<br>        path = string<br>      }))<br>    })<br>    unique_key = list(string)<br>    conflict_resolution_policy = object({<br>      mode      = string<br>      path      = string<br>      procedure = string<br>    })<br>  }))</pre> | `{}` | no |
| <a name="input_databases"></a> [databases](#input\_databases) | Map of Cosmos DB SQL DBs to create. Some parameters are inherited from the Cosmos account. | <pre>map(object({<br>    db_name           = string<br>    db_throughput     = number<br>    db_max_throughput = number<br>  }))</pre> | `{}` | no |
| <a name="input_enable_access_key_metadata_writes"></a> [enable\_access\_key\_metadata\_writes](#input\_enable\_access\_key\_metadata\_writes) | Optional) Is write operations on metadata resources (databases, containers, throughput) via account keys enabled? | `bool` | `true` | no |
| <a name="input_enable_automatic_failover"></a> [enable\_automatic\_failover](#input\_enable\_automatic\_failover) | (Optional) Enable automatic failover for this Cosmos DB account. | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to deploy to | `string` | n/a | yes |
| <a name="input_kind"></a> [kind](#input\_kind) | (Optional) Specifies the Kind of CosmosDB to create | `string` | `"GlobalDocumentDB"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"uksouth"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of your Cosmos DB Account | `string` | n/a | yes |
| <a name="input_offer_type"></a> [offer\_type](#input\_offer\_type) | (Required) Specifies the Offer Type to use for this CosmosDB Account; currently, this can only be set to Standard. | `string` | `"Standard"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The resource group your Cosmos DB account will be assigned to | `string` | n/a | yes |
| <a name="input_secondary_location"></a> [secondary\_location](#input\_secondary\_location) | n/a | `string` | `"ukwest"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cosmosdb_account_id"></a> [cosmosdb\_account\_id](#output\_cosmosdb\_account\_id) | n/a |
<!-- END_TF_DOCS -->