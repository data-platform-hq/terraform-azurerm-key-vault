# Required
variable "project" {
  type        = string
  description = "Project name"
}

variable "env" {
  type        = string
  description = "Environment name"
}

variable "resource_group" {
  type        = string
  description = "The name of the resource group in which to create the storage account"
}

variable "location" {
  type        = string
  description = "Azure location"
}

variable "tenant_id" {
  type        = string
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault"
}

variable "default_access_object_id_list" {
  type        = set(string)
  description = "Set of Default Object ID to allow key vault modification"
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Enable purge Protection for this Key Vault"
  default     = false
}

# Optional
variable "sku_name" {
  type        = string
  description = "The Name of the SKU used for this Key Vault: [standard, premium]"
  default     = "standard"
}

variable "tde_key_name" {
  type        = string
  description = "Name of TDE key for SQL Server"
  default     = "tde-sql-key"
}

variable "key_type" {
  type        = string
  description = "Key Type to use for this Key Vault Key: [EC|EC-HSM|Oct|RSA|RSA-HSM]"
  default     = "RSA"
}

variable "key_size" {
  type        = number
  description = "Size of the RSA key to create in bytes, requied for RSA & RSA-HSM: [1024|2048]"
  default     = 2048
}

variable "key_opts" {
  type        = list(string)
  description = "JSON web key operations: [decrypt|encrypt|sign|unwrapKey|verify|wrapKey]"
  default = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey"
  ]
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys"
  default     = true
}

variable "soft_delete_retention_days" {
  type        = number
  description = "The number of days that items should be retained for once soft-deleted"
  default     = 7
}

variable "tags" {
  type        = map(any)
  description = "mapping of tags to assign to the resource"
  default     = {}
}

variable "ip_rules" {
  type        = map(string)
  description = "Map of IP addresses permitted to access storage account"
  default     = null
}

variable "virtual_networks" {
  type        = list(string)
  description = "A list of resource ids for subnets"
  default     = null
}

variable "bypass" {
  type        = string
  description = "Specifies which traffic can bypass the network rules. Possible values are `AzureServices` and `None`"
  default     = "AzureServices"
}
