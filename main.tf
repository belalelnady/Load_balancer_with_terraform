module "vpc" {
  source   = "./network/vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "load-balancer-vpc"
}

module "subnets" {
  source      = "./network/subnets"
  vpc-id      = module.vpc.vpc-id
  subnet_data = var.subnet_data
}

module "internet_gw" {
  source = "./network/internet_GW"
  vpc_id = module.vpc.vpc-id
  name   = "internet-gateway"
}

module "nat" {
  source    = "./network/NAT_GW"
  subnet_id = module.subnets.subnets_id["public-subnet1"]
  nat_name  = "lb-nat"
}

# public routing table
module "public_routing_table" {
  source             = "./network/route_table"
  vpc_id             = module.vpc.vpc-id
  gateway_id         = module.internet_gw.internet_gateway_id
  routing_table_name = "public-routing-table"
}

#private routing table
module "private_routing_tables" {
  source             = "./network/route_table"
  vpc_id             = module.vpc.vpc-id
  gateway_id         = module.nat.nat_gateway_id
  routing_table_name = "private-routing-table"
}

# public assossiiation
module "rt_public_assosiation" {
  source         = "./network/route_t_association"
  subnet_id_list = module.subnets.puplic_subnets_id
  rt_id          = module.public_routing_table.route_id
}

# private assossiiation
module "rt_private_assosiation" {
  source         = "./network/route_t_association"
  subnet_id_list = module.subnets.private_subnets_id
  rt_id          = module.private_routing_tables.route_id
}

