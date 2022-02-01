provider "azurerm" {
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

module "network" {
  source                  = "./modules/Vnet"
  resource_group_name     = azurerm_resource_group.rg.name
  resource_group_location = azurerm_resource_group.rg.location
  address_spaces          = ["10.0.0.0/16", "10.2.0.0/16"]
  subnet_prefixes         = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names            = ["subnet1", "subnet2", "subnet3"]
}

resource "azurerm_container_registry" "acr" {
  name                = "acrresouces"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = false

  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.example.id
    ]
  }
}

resource "azurerm_user_assigned_identity" "example" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  name                = "registry-uai"
}

module "Vault" {
  source                   = "./modules/Vault"
  resource_group_name      = azurerm_resource_group.rg.name
  resource_group_location  = azurerm_resource_group.rg.location
  environment              = var.environment
  purge_protection_enabled = var.purge_protection_enabled
  tenant_id                = var.tenant_id
  object_id                = var.object_id
}
 