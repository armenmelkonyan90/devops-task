resource "azurerm_virtual_network" "main" {
  name                = var.vnet-name
  address_space       = ["10.0.0.0/16"]
  location            = var.rg-location
  resource_group_name = var.rg-name
}

resource "azurerm_subnet" "main" {
  name                 = var.subnet-name # "internal"
  resource_group_name  = var.rg-name
  virtual_network_name = var.vnet-name
  address_prefixes     = var.subnet-cidr #["10.0.2.0/24"]
  depends_on = [
    azurerm_virtual_network.main
  ]
}

resource "azurerm_public_ip" "main" {
  name                = var.public-ip-name #"acceptanceTestPublicIp1"
  resource_group_name = var.rg-name
  location            = var.rg-location
  allocation_method   = var.public-ip-method #"Static"

}

resource "azurerm_network_interface" "main" {
  name                = var.ni-name
  location            = var.rg-location
  resource_group_name = var.rg-name

  ip_configuration {
    name                          = var.ip-config-name #"testconfiguration1"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = var.pv-ip-allocation #"Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id
  }
}

resource "azurerm_network_security_group" "main" {
  name                = var.sg-name #"acceptanceTestSecurityGroup1"
  location            = var.rg-location
  resource_group_name = var.rg-name

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
    name                       = "test1234"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.main.id
  network_security_group_id = azurerm_network_security_group.main.id
}

resource "azurerm_virtual_machine" "main" {
  name                  = var.vm-name
  location              = var.rg-location
  resource_group_name   = var.rg-name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS2_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    id = var.source-image-id # "/subscriptions/7014b7d6-c531-45a6-890b-c51b97f7ceb0/resourceGroups/elk-rg/providers/Microsoft.Compute/images/elkimage"
  }

  #   storage_image_reference {
  #     publisher = "Canonical"
  #     offer     = "UbuntuServer"
  #     sku       = "16.04-LTS"
  #     version   = "latest"
  #   }
  storage_os_disk {
    name              = var.os-name          #"myosdisk1"
    caching           = var.os-cache         #"ReadWrite"
    create_option     = var.os-create-option #"FromImage"
    managed_disk_type = var.os-disk-type     # "Standard_LRS"
  }
  os_profile {
    computer_name  = var.computer-name  #"hostname"
    admin_username = var.admin-username #"testadmin"
    admin_password = var.admin-password #"Password1234!"

  }

  os_profile_linux_config {
    disable_password_authentication = var.pass-auth #false
    ssh_keys {
      path     = "/home/${var.admin-username}/.ssh/authorized_keys"
      key_data = file("~/.ssh/devtask.pub")
    }
  }

}
