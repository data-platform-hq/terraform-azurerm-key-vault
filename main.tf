locals {
  ip_rules = var.ip_rules == null ? null : flatten([for k, v in values(var.ip_rules) : v])

  rbac_users_mapped = { for object in var.rbac_users : "${object.username}:${object.role_definition_name}" => object }
}

data "azurerm_client_config" "this" {}

resource "azurerm_key_vault" "this" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.this.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled
  tags                        = var.tags
  sku_name                    = var.sku_name

  enable_rbac_authorization = var.rbac_authorization_enabled

  network_acls {
    default_action             = var.firewall_default_action
    bypass                     = var.bypass
    ip_rules                   = local.ip_rules
    virtual_network_subnet_ids = var.virtual_networks
  }
}

resource "azurerm_role_assignment" "admins" {
  for_each = var.rbac_authorization_enabled ? var.default_access_object_id_list : toset([])

  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "users" {
  for_each = var.rbac_authorization_enabled ? local.rbac_users_mapped : {}

  scope                = azurerm_key_vault.this.id
  role_definition_name = each.value.role_definition_name
  principal_id         = each.value.object_id
}

resource "azurerm_key_vault_access_policy" "this" {
  for_each = var.rbac_authorization_enabled ? toset([]) : var.default_access_object_id_list

  key_vault_id = azurerm_key_vault.this.id
  tenant_id    = data.azurerm_client_config.this.tenant_id
  object_id    = each.value

  key_permissions     = var.key_permissions
  secret_permissions  = var.secret_permissions
  storage_permissions = var.storage_permissions
}

data "azurerm_monitor_diagnostic_categories" "this" {
  count       = var.enable_diagnostic_setting ? 1 : 0
  resource_id = azurerm_key_vault.this.id
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  count = var.enable_diagnostic_setting ? 1 : 0

  name                           = coalesce(var.diagnostics_settings_name, "ds-${var.key_vault_name}")
  target_resource_id             = azurerm_key_vault.this.id
  log_analytics_workspace_id     = var.analytics_workspace_id
  log_analytics_destination_type = var.analytics_destination_type

  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.this[0].log_category_types
    content {
      category = enabled_log.value
    }
  }

  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.this[0].metrics
    content {
      category = metric.value
    }
  }
  lifecycle {
    ignore_changes = [log_analytics_destination_type] # TODO remove when issue is fixed: https://github.com/Azure/azure-rest-api-specs/issues/9281
  }
}

resource "azurerm_key_vault_access_policy" "assigned_identity" {
  for_each = { for i in var.key_vault_policy_config : i.object_id => i if i.object_id != null }

  key_vault_id       = azurerm_key_vault.this.id
  tenant_id          = data.azurerm_client_config.this.tenant_id
  object_id          = each.value.object_id
  key_permissions    = each.value.key_permissions
  secret_permissions = each.value.secret_permissions
}
