source "azure-arm" "main" {
  
  // client_id = "fe354398-d7sf-4dc9-87fd-c432cd8a7e09"
  resource_group_name = "elk-rg"
  storage_account = "elkstorageaccount"

  capture_container_name = "images"
  capture_name_prefix = "packer"

  os_type = "Linux"
  image_publisher = "Canonical"
  image_offer = "UbuntuServer"
  image_sku = "20.04-LTS"

  location = "West US"
  vm_size = "Standard_A2"
}
