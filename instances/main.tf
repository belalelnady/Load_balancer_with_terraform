resource "aws_instance" "bastion" {
  ami                    = var.ami_id
  instance_type         = var.instance_type
  subnet_id             = var.public_subnet_id
  security_groups       = [var.bastion_sg_id]
  key_name              = var.key_name

  tags = {
    Name = "Bastion Host"
  }

   provisioner "local-exec" {
    command = <<-EOT
      #!/bin/bash
      chmod 600 $HOME/.ssh/${var.key_name}.pem
      sleep 100
      scp -o StrictHostKeyChecking=no -i /home/belal/.ssh/${var.key_name}.pem  /home/belal/.ssh/${var.key_name}.pem ubuntu@${self.public_ip}:/home/ubuntu/.ssh 
    EOT
  }
  
}

resource "aws_instance" "private_instance_1" {
  ami                    = var.ami_id
  instance_type         = var.instance_type
  subnet_id             = var.private_subnet_1_id
  security_groups       = [var.private_sg_id]
  key_name              = var.key_name

  user_data = "${file("scripts/install-nginx.sh")}"

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

  user_data = "${file("scripts/install-nginx.sh")}"

  tags = {
    Name = "Private Instance 2"
  }
}
