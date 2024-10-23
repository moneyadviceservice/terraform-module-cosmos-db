# terraform-module-cosmos-db
A Terraform module for the creation of Cosmos DB Accounts

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_cosmosdb_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) | resource |
| [random_integer.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_analytical_storage_schema"></a> [analytical\_storage\_schema](#input\_analytical\_storage\_schema) | The schema type of the Analytical Storage for this Cosmos DB account. | `string` | `"WellDefined"` | no |
| <a name="input_backup_interval"></a> [backup\_interval](#input\_backup\_interval) | The interval in minutes between two backups. | `number` | `240` | no |
| <a name="input_backup_retention"></a> [backup\_retention](#input\_backup\_retention) | The time in hours that each backup is retained. | `number` | `8` | no |
| <a name="input_capability"></a> [capability](#input\_capability) | Configure capabilities to be enabled for this Cosmos DB account | `string` | `null` | no |
| <a name="input_consistency_level"></a> [consistency\_level](#input\_consistency\_level) | (Required) The Consistency Level to use for this CosmosDB Account | `string` | `"Session"` | no |
| <a name="input_enable_access_key_metadata_writes"></a> [enable\_access\_key\_metadata\_writes](#input\_enable\_access\_key\_metadata\_writes) | Optional) Is write operations on metadata resources (databases, containers, throughput) via account keys enabled? | `bool` | `true` | no |
| <a name="input_enable_automatic_failover"></a> [enable\_automatic\_failover](#input\_enable\_automatic\_failover) | (Optional) Enable automatic failover for this Cosmos DB account. | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to deploy to | `string` | n/a | yes |
| <a name="input_kind"></a> [kind](#input\_kind) | (Optional) Specifies the Kind of CosmosDB to create | `string` | `"GlobalDocumentDB"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"uksouth"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of your function app | `string` | n/a | yes |
| <a name="input_offer_type"></a> [offer\_type](#input\_offer\_type) | (Required) Specifies the Offer Type to use for this CosmosDB Account; currently, this can only be set to Standard. | `string` | `"Standard"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The resource group your function app will be assigned to | `string` | n/a | yes |
| <a name="input_secondary_location"></a> [secondary\_location](#input\_secondary\_location) | n/a | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cosmosdb_account_id"></a> [cosmosdb\_account\_id](#output\_cosmosdb\_account\_id) | n/a |
<!-- END_TF_DOCS -->