
packer {
required_plugins {
  azure = {
    version = ">= 1.3.0"
    source  = "github.com/hashicorp/azure"
  }
}
}
source "azure-arm" "main" {
  use_azure_cli_auth = true
  // client_id = "fe354398-d7sf-4dc9-87fd-c432cd8a7e09"
  // resource_group_name = "elk-rg"
  // storage_account = "elkstaccount"
  subscription_id = "7014b7d6-c531-45a6-890b-c51b97f7ceb0"
  managed_image_name = "elkimage"
  managed_image_resource_group_name = "elk-rg"
  // capture_container_name = "images"
  // capture_name_prefix = "packer"
  private_virtual_network_with_public_ip = true
  os_type = "Linux"
  image_offer = "0001-com-ubuntu-server-focal"
  image_publisher = "Canonical"
  // image_offer = "UbuntuServer"
  image_sku = "20_04-lts"
  communicator = "ssh"
  ssh_username = "ubuntu"
  ssh_private_key_file = "~/.ssh/devtask"

  location = "West Europe"
  vm_size = "Standard_A2_V2"
}

build {
	sources = ["source.azure-arm.main"]

	provisioner "ansible" {
	 	playbook_file = "../Ansible/deploy_elastic_stack.yml"
	}
}

