# Azure Key Vault Terraform module
Terraform module for creation Azure Key Vault

## Usage

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.23.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.24.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                                                  | Type       |
|-------------------------------------------------------------------------------------------------------------------------------------------------------|------------|
| [azurerm_key_vault.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault)                                   | resource   |
| [azurerm_key_vault_access_policy.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy)       | resource   |
| [azurerm_monitor_diagnostic_setting.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource   |

## Inputs

| Name                                                                                                                              | Description                                                                                                           | Type            | Default                                | Required |
|-----------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|-----------------|----------------------------------------|:--------:|
| <a name="input_bypass"></a> [bypass](#input\_bypass)                                                                              | Specifies which traffic can bypass the network rules. Possible values are `AzureServices` and `None`                  | `set(string)`   | <pre>[<br>  "AzureServices"<br>]</pre> |    no    |
| <a name="input_default_access_object_id_list"></a> [default\_access\_object\_id\_list](#input\_default\_access\_object\_id\_list) | Set of Default Object ID to allow key vault modification                                                              | `set(string)`   | n/a                                    |   yes    |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption)         | Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys | `bool`          | `true`                                 |    no    |
| <a name="input_env"></a> [env](#input\_env)                                                                                       | Environment name                                                                                                      | `string`        | n/a                                    |   yes    |
| <a name="input_ip_rules"></a> [ip\_rules](#input\_ip\_rules)                                                                      | Map of IP addresses permitted to access storage account                                                               | `map(string)`   | `null`                                 |    no    |
| <a name="input_location"></a> [location](#input\_location)                                                                        | Azure location                                                                                                        | `string`        | n/a                                    |   yes    |
| <a name="input_project"></a> [project](#input\_project)                                                                           | Project name                                                                                                          | `string`        | n/a                                    |   yes    |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled)                    | Enable purge Protection for this Key Vault                                                                            | `bool`          | `false`                                |    no    |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group)                                                    | The name of the resource group in which to create the storage account                                                 | `string`        | n/a                                    |   yes    |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name)                                                                      | The Name of the SKU used for this Key Vault: [standard, premium]                                                      | `string`        | `"standard"`                           |    no    |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days)            | The number of days that items should be retained for once soft-deleted                                                | `number`        | `7`                                    |    no    |
| <a name="input_tags"></a> [tags](#input\_tags)                                                                                    | mapping of tags to assign to the resource                                                                             | `map(any)`      | `{}`                                   |    no    |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id)                                                                   | The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault                 | `string`        | n/a                                    |   yes    |
| <a name="input_virtual_networks"></a> [virtual\_networks](#input\_virtual\_networks)                                              | A list of resource ids for subnets                                                                                    | `list(string)`  | `null`                                 |    no    |
| <a name="input_analytics_workspace_id"></a> [analytics\_workspace\_id](#input\_analytics\_workspace\_id)                          | Resource ID of Log Analytics workspace                                                                                | `string`        | `null`                                 |    no    |
| <a name="input_analytics_destination_type"></a> [analytics\_destination\_type](#input\_analytics\_destination\_type)              | Possible values are AzureDiagnostics and Dedicated.                                                                   | `string`        | `Dedicated`                            |    no    |
| <a name="input_enable_diagnostic_setting"></a> [enable\_diagnostic\_setting](#input\_enable\_diagnostic\_setting)                 | Enable diagnostic setting. var.analytics_workspace_id must be provided                                                | `bool`          | `false`                                |    no    |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Key Vault ID |
| <a name="output_name"></a> [name](#output\_name) | Key Vault name |
| <a name="output_name_to_id_map"></a> [name\_to\_id\_map](#output\_name\_to\_id\_map) | Map of key vault name to Id |
| <a name="output_uri"></a> [uri](#output\_uri) | Key Vault URI |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-azurerm-key-vault/tree/main/LICENSE)
