module "vpc" {
  source   = "./network/vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "load-balancer-vpc"
}

module "subnets" {
  source = "./network/subnets"
  vpc-id = module.vpc.vpc-id
  subnet_data = var.subnet_data
}

module "internet_gw" {
  source = "./network/internet_GW"
  vpc_id = module.vpc.vpc-id
  name = "internet-gateway"
}

module "nat" {
  source = "./network/NAT_GW"
  subnet_id = module.subnets.subnets_id["public-subnet1"]
  nat_name = "lb-nat"
}