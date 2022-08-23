provider "azurerm" {
  features {}
}

provider "aws" {
  region = "eu-central-1"
  alias  = "aws_cloud"
}
