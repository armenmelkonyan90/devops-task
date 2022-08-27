module "elastic" {
  source = "../../modules/Elastic_Stack"
}

output "elastic-public-ip" {
  value = module.elastic.elastic-public-ip
}
