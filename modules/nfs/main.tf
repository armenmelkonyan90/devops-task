
resource "azurerm_resource_group" "main" {
  name     = var.nfs_resource_group_name
  location = var.nfs_location
}

resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name #"examplevn"
  address_space       = var.vnet_cidr #["10.0.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "main_hpc" {
  name                 = var.hpc_subnet_name # "examplesubnethpc"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.hpc_subnet_cidr # ["10.0.1.0/24"]
}

resource "azurerm_hpc_cache" "main" {
  name                = var.hpc_cache_name #"examplehpccache"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  cache_size_in_gb    = var.hpc_cache_size #3072
  subnet_id           = azurerm_subnet.main_hpc.id
  sku_name            = var.hpc_sku_name #"Standard_2G"
}

resource "azurerm_subnet" "main_vm" {
  name                 = var.vm_subnet_name #"examplesubnetvm"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.vm_subnet_cidr #["10.0.2.0/24"]
}
resource "azurerm_network_security_group" "main" {
  name                = var.sg_name #"acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "test123"
    priority                   = 110
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}
resource "azurerm_network_interface" "main" {
  name                = var.ni_name #"examplenic"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = var.ip_config_name # "internal"
    subnet_id                     = azurerm_subnet.main_vm.id
    private_ip_address_allocation = var.pr_ip_allocation #"Dynamic"
  }
}
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.main.id
  network_security_group_id = azurerm_network_security_group.main.id
}
locals {
  custom_data = file("custom_data.sh")
}

resource "azurerm_linux_virtual_machine" "main" {
  name                  = "${var.prefix}-vm"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.main.id]
  size               = var.nfs_vm_size        #"Standard_DS1_v2"  
  admin_username        = var.admin_username #"adminuser"


  admin_ssh_key {
    username   = var.admin_username #"adminuser"
    public_key = file("~/.ssh/devtask.pub")
  }

  os_disk {
    caching              = var.os_caching #"ReadWrite"
    storage_account_type = var.sa_type    #"Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  custom_data = base64encode(local.custom_data)
}

resource "azurerm_hpc_cache_nfs_target" "main" {
  name                = var.hpcCNT_name #"examplehpcnfstarget"
  resource_group_name = azurerm_resource_group.main.name
  cache_name          = azurerm_hpc_cache.main.name
  target_host_name    = azurerm_linux_virtual_machine.main.private_ip_address
  usage_model         = var.usage_model #"READ_HEAVY_INFREQ"
  namespace_junction {
    namespace_path = "/nfs/mongodb-pvc"
    nfs_export     = "/export/mongodb-pvc"

  }

}
