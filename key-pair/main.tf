resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create a key pair "terraform-lab" to AWS
resource "aws_key_pair" "kp" {
  key_name   = var.key_name
  public_key = tls_private_key.pk.public_key_openssh


}

  # excute this command localy and save "terraform-lab.pem" to .ssh 
resource "local_file" "private_key_pem" {
  content  = tls_private_key.pk.private_key_pem
  filename = "/home/belal/.ssh/${var.key_name}.pem"
}

 