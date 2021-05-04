## vpc.tf
provider "aws" {
  region     = "us-east-1"
}

module "vpc" {
  source           = "./modules/services/vpc"
  cidr_blocknumber = "10.0.0.0/16"
  vpc_name         = "vpc_${var.env}"
}
