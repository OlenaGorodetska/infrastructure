data "azurerm_client_config" "current" {}
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
  network_acls {
    default_action = "Allow"
    bypass         = "AzureServices"
  }
}

resource "azurerm_role_assignment" "role-secret-officer" {
  role_definition_name = "Key Vault secrets officer"
  scope         = azurerm_key_vault.vault.id
  principal_id  = data.azurerm_client_config.current.tenant_id
}

resource "azurerm_key_vault_secret" "database-password" {
  name = var.secret_name
  value = var.secret_value
  key_vault_id = azurerm_key_vault.vault.id
}

resource "azurerm_role_assignment" "role-secret-user" {
  role_definition_name = "Key Vault secrets user"
  scope         = azurerm_key_vault.vault.id/secrets/azurerm_key_vault_secret.database-password.name
  principal_id  = data.azurerm_client_config.current.tenant_id
}

