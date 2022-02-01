resource "azurerm_key_vault" "vault" {
  name                        = format("%s-kv", lower(var.environment))
  location                    = var.resource_group_location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  enabled_for_template_deployment = var.enabled_for_template_deployment
  purge_protection_enabled    = var.purge_protection_enabled

  sku_name = var.sku_name

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}


  # dynamic "network_acls" {
  #   for_each = var.network_acls != null ? [true] : []
  #   content {
  #     bypass                     = var.network_acls.bypass
  #     default_action             = var.network_acls.default_action
  #     ip_rules                   = var.network_acls.ip_rules
  #     virtual_network_subnet_ids = var.network_acls.virtual_network_subnet_ids
  #   }
  # }