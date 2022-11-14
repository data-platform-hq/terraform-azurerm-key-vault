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

variable "default_access_object_id_list" {
  type        = set(string)
  description = "Set of Default Object ID to allow key vault modification"
  default     = []
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

variable "firewall_default_action" {
  type        = string
  description = "The default action of allow or deny when no other rules match: [Allow|Deny]"
  default     = "Deny"
}

variable "bypass" {
  type        = string
  description = "Specifies which traffic can bypass the network rules. Possible values are `AzureServices` and `None`"
  default     = "AzureServices"
}
