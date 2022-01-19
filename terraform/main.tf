provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "dev-resources"
  location = "westeurope"
}

module "network" {
  # source              = "Azure/network/azurerm"
  source = "../modules/Vnet"
  resource_group_name = azurerm_resource_group.rg.name
  address_spaces      = ["10.0.0.0/16", "10.2.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]

  subnet_service_endpoints = {
    # "subnet1" : ["Microsoft.KeyVault"], 
    # "subnet2" : ["Microsoft.PrivateEndpoint"],
    "subnet3" : ["Microsoft.Web"]
  }

  tags = {
    environment = "dev"
  }

  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_container_registry" "acr" {
  name                     = "acrresouces"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  sku                      = "Basic"
  admin_enabled            = false

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


# # Create a private postgres database
# module "postgres" {
#     source              = "../../../terraform-modules/db/"
#     postgresql-admin-login = azurerm_postgresql_server.postgresql_server.administrator_login
#     postgresql-admin-password = "${local.postgresql-admin-password}"
# }