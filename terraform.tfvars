subnet_data = {
  public-subnet1 = {
    cidr              = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    map_value         = true
  }
  public-subnet2 = {
    cidr              = "10.0.2.0/24"
    availability_zone = "us-east-1b"
    map_value         = true
  }

  private-subnet1 = {
    cidr              = "10.0.3.0/24"
    availability_zone = "us-east-1a"
    map_value         = false
  }
  
  private-subnet2 = {
    cidr              = "10.0.4.0/24"
    availability_zone = "us-east-1b"
    map_value         = false
  }

}


# private_instances_data = {
#     private_instance_1 = {
#       ami_id           = "ami-0c94855ba95c71c99" # Replace with your desired AMI
#       instance_type    = "t2.micro"
#       subnet_id        = aws_subnet.private_1.id
#       security_group_id = module.security_groups.private_sg_id
#       subnet_name      = ""
#     }
#     private_instance_2 = {
#       ami_id           = "ami-0c94855ba95c71c99" # Replace with your desired AMI
#       instance_type    = "t2.micro"
#       subnet_id        = aws_subnet.private_2.id
#       security_group_id = module.security_groups.private_sg_id
#       subnet_name      = ""
#     }
# }