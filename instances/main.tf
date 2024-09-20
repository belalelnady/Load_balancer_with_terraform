resource "aws_instance" "bastion" {
  ami                    = var.ami_id
  instance_type         = var.instance_type
  subnet_id             = var.public_subnet_id
  security_groups       = [var.bastion_sg_id]
  key_name              = var.key_name

  tags = {
    Name = "Bastion Host"
  }
}

resource "aws_instance" "private_instance_1" {
  ami                    = var.ami_id
  instance_type         = var.instance_type
  subnet_id             = var.private_subnet_1_id
  security_groups       = [var.private_sg_id]
  key_name              = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              EOF

  tags = {
    Name = "Private Instance 1"
  }
}

resource "aws_instance" "private_instance_2" {
  ami                    = var.ami_id
  instance_type         = var.instance_type
  subnet_id             = var.private_subnet_2_id
  security_groups       = [var.private_sg_id]
  key_name              = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              EOF

  tags = {
    Name = "Private Instance 2"
  }
}



# resource "aws_instance" "private_instances" {
#   for_each            = var.private_data

#   ami                 = each.value.ami_id
#   instance_type      = each.value.instance_type
#   subnet_id          = each.value.subnet_key[].id
#   security_groups    = [var.private_sg_id]
#   key_name           = var.key_name

#   user_data = <<-EOF
#               #!/bin/bash
#               sudo apt update -y
#               sudo apt install nginx -y
#               EOF

#   tags = {
#     Name = each.key
#   }
# }

