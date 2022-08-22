build {
	sources = ["source.azure-arm.main"]

	provisioner "ansible" {
	 	playbook_file = "../Ansible/deploy_elastic_stack.yml"
	}
}