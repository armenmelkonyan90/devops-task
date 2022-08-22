resource "azurerm_resource_group" "Elk-RG" {
  name     = "elk-rg"
  location = "West Europe"
}



resource "azurerm_network_security_group" "main" {
  name                = "elk-security-group"
  location            = azurerm_resource_group.Elk-RG.location
  resource_group_name = azurerm_resource_group.Elk-RG.name
}

resource "azurerm_virtual_network" "example" {
  name                = "elk-network"
  location            = azurerm_resource_group.Elk-RG.location
  resource_group_name = azurerm_resource_group.Elk-RG.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]



  subnet {
    name           = "elk-subnet"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.Elk-RG.id
  }

  tags = {
    environment = "elk"
  }
}
resource "azurerm_public_ip" "main" {
  name                = "elk-public-ip"
  resource_group_name = azurerm_resource_group.Elk-RG.name
  location            = azurerm_resource_group.Elk-RG.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}