# Azure Key Vault Terraform module
Terraform module for creation Azure Key Vault

## Usage

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.0.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 4.0.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_access_policy.assigned_identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_monitor_diagnostic_setting.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_role_assignment.admins](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.users](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_client_config.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_monitor_diagnostic_categories.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_diagnostic_categories) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_analytics_destination_type"></a> [analytics\_destination\_type](#input\_analytics\_destination\_type) | Possible values are AzureDiagnostics and Dedicated. | `string` | `"Dedicated"` | no |
| <a name="input_analytics_workspace_id"></a> [analytics\_workspace\_id](#input\_analytics\_workspace\_id) | Resource ID of Log Analytics Workspace | `string` | `null` | no |
| <a name="input_bypass"></a> [bypass](#input\_bypass) | Specifies which traffic can bypass the network rules. Possible values are `AzureServices` and `None` | `string` | `"AzureServices"` | no |
| <a name="input_default_access_object_id_list"></a> [default\_access\_object\_id\_list](#input\_default\_access\_object\_id\_list) | Set of Default Object ID to allow key vault modification | `set(string)` | `[]` | no |
| <a name="input_diagnostics_settings_name"></a> [diagnostics\_settings\_name](#input\_diagnostics\_settings\_name) | Diagnostics settings name | `string` | `null` | no |
| <a name="input_enable_diagnostic_setting"></a> [enable\_diagnostic\_setting](#input\_enable\_diagnostic\_setting) | Enable diagnostic setting. var.analytics\_workspace\_id must be provided | `bool` | `false` | no |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption) | Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys | `bool` | `true` | no |
| <a name="input_firewall_default_action"></a> [firewall\_default\_action](#input\_firewall\_default\_action) | The default action of allow or deny when no other rules match: [Allow\|Deny] | `string` | `"Deny"` | no |
| <a name="input_ip_rules"></a> [ip\_rules](#input\_ip\_rules) | Map of IP addresses permitted to access storage account | `map(string)` | `null` | no |
| <a name="input_key_permissions"></a> [key\_permissions](#input\_key\_permissions) | List of KeyVault keys permissions | `list(string)` | <pre>[<br>  "Create",<br>  "Update",<br>  "Backup",<br>  "Update",<br>  "Delete",<br>  "Get",<br>  "List",<br>  "Purge",<br>  "Recover",<br>  "Restore",<br>  "Import",<br>  "GetRotationPolicy",<br>  "SetRotationPolicy"<br>]</pre> | no |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | Key vault name | `string` | n/a | yes |
| <a name="input_key_vault_policy_config"></a> [key\_vault\_policy\_config](#input\_key\_vault\_policy\_config) | List of object with parameters to create Key Vault Access Policy | <pre>list(object({<br>    object_id          = string<br>    key_permissions    = optional(list(string))<br>    secret_permissions = optional(list(string))<br>  }))</pre> | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure location | `string` | n/a | yes |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | Enable purge Protection for this Key Vault | `bool` | `false` | no |
| <a name="input_rbac_authorization_enabled"></a> [rbac\_authorization\_enabled](#input\_rbac\_authorization\_enabled) | RBAC authorization switch | `bool` | `false` | no |
| <a name="input_rbac_users"></a> [rbac\_users](#input\_rbac\_users) | List of objects to configure Key Vault users using RBAC Roles | <pre>list(object({<br>    username             = string<br>    object_id            = string<br>    role_definition_name = string<br>  }))</pre> | `[]` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | The name of the resource group in which to create the storage account | `string` | n/a | yes |
| <a name="input_secret_permissions"></a> [secret\_permissions](#input\_secret\_permissions) | List of KeyVault secrets permissions | `list(string)` | <pre>[<br>  "Backup",<br>  "Delete",<br>  "Get",<br>  "List",<br>  "Purge",<br>  "Recover",<br>  "Restore",<br>  "Set"<br>]</pre> | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The Name of the SKU used for this Key Vault: [standard, premium] | `string` | `"standard"` | no |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | The number of days that items should be retained for once soft-deleted | `number` | `7` | no |
| <a name="input_storage_permissions"></a> [storage\_permissions](#input\_storage\_permissions) | List of KeyVault storage permissions | `list(string)` | <pre>[<br>  "Get",<br>  "List",<br>  "Set",<br>  "SetSAS",<br>  "GetSAS",<br>  "DeleteSAS",<br>  "Update",<br>  "RegenerateKey",<br>  "Backup",<br>  "Delete",<br>  "Purge",<br>  "Recover"<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | mapping of tags to assign to the resource | `map(any)` | `{}` | no |
| <a name="input_virtual_networks"></a> [virtual\_networks](#input\_virtual\_networks) | A list of resource ids for subnets | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Key Vault ID |
| <a name="output_name"></a> [name](#output\_name) | Key Vault name |
| <a name="output_uri"></a> [uri](#output\_uri) | Key Vault URI |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-azurerm-key-vault/tree/main/LICENSE)
