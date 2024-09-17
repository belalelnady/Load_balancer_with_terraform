module "vpc" {
  source   = "./vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "load-balancer-vpc"
}

module "subnets" {
  source = "./subnets"
  vpc-id = module.vpc.vpc-id
  subnet_data = var.subnet_data
}