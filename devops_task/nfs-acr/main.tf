module "nfs" {
  source = "../../modules/nfs"
  providers = {
    aws = aws.aws_cloud
  }
}

module "acr" {
  source = "../../modules/ACR"
}
