module "elastic" {
  source = "../../modules/elastic"
}

output "elastic-public-ip" {
	value = module.elastic.elastic-public-ip
  
}