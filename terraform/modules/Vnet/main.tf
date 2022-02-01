resource "azurerm_virtual_network" "vnet" {
  name                                           = var.vnet_name
  resource_group_name                            = var.resource_group_name 
  location                                       = var.resource_group_location
  address_space                                  = length(var.address_spaces) == 0 ? [var.address_space] : var.address_spaces
  dns_servers                                    = var.dns_servers
}

resource "azurerm_subnet" "subnet" {
  count                                          = length(var.subnet_names)
  name                                           = var.subnet_names[count.index]
  resource_group_name                            = var.resource_group_name
  address_prefixes                               = [var.subnet_prefixes[count.index]]
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  enforce_private_link_endpoint_network_policies = lookup(var.subnet_enforce_private_link_endpoint_network_policies, var.subnet_names[count.index], false)
  service_endpoints                              = lookup(var.subnet_service_endpoints, var.subnet_names[count.index], [])
} 