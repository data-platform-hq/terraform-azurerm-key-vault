locals {
  ip_rules = var.ip_rules == null ? null : flatten([for k, v in values(var.ip_rules) : v])
}

data "azurerm_client_config" "this" {}

resource "azurerm_key_vault" "this" {
  name                        = "${var.project}-${var.env}-${var.location}"
  location                    = var.location
  resource_group_name         = var.resource_group
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.this.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled
  tags                        = var.tags
  sku_name                    = var.sku_name

  network_acls {
    default_action             = var.firewall_default_action
    bypass                     = var.bypass
    ip_rules                   = local.ip_rules
    virtual_network_subnet_ids = var.virtual_networks
  }
}

resource "azurerm_key_vault_access_policy" "this" {
  for_each = var.default_access_object_id_list

  key_vault_id = azurerm_key_vault.this.id
  tenant_id    = var.tenant_id
  object_id    = each.value

  key_permissions = [
    "Create",
    "Backup",
    "Delete",
    "Get",
    "List",
    "Purge",
    "Recover",
    "Restore",
    "Import"
  ]

  secret_permissions = [
    "Backup",
    "Delete",
    "Get",
    "List",
    "Purge",
    "Recover",
    "Restore",
    "Set"
  ]

  storage_permissions = [
    "Get",
    "List"
  ]
}

resource "azurerm_key_vault_key" "this" {
  name         = var.tde_key_name
  key_type     = var.key_type
  key_size     = var.key_size
  key_vault_id = azurerm_key_vault.this.id
  key_opts     = var.key_opts

  depends_on = [
    azurerm_key_vault.this,
    azurerm_key_vault_access_policy.this
  ]
}
