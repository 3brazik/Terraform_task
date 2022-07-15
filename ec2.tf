resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Generate a Private Key and encode it as PEM.
resource "aws_key_pair" "key_pair" {
  key_name   = "key"
  public_key = tls_private_key.key.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.key.private_key_pem}' > ./key.pem"
  }
}

# Create a EC2 Instance (Ubuntu 20)
resource "aws_instance" "public_ec2" {
  instance_type          = "t2.micro" # free instance
  ami                    = var.ami_id
  key_name               = aws_key_pair.key_pair.id
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
  subnet_id              = aws_subnet.public1.id

  tags = {
    Name = "bastion-ec2"
  }

  
}

# Create and assosiate an Elastic IP
resource "aws_eip" "eip" {
  instance = aws_instance.public_ec2.id
}



resource "aws_instance" "private_ec2" {
  instance_type          = "t2.micro" # free instance
  ami                    = var.ami_id
  key_name               = aws_key_pair.key_pair.id
  vpc_security_group_ids = ["${aws_security_group.ssh_and_port3000.id}"]
  subnet_id              = aws_subnet.private2.id

  tags = {
    Name = "application-ec2"
  }

  
}
resource "aws_secretsmanager_secret" "secretsmanager" {
  name = "private-secret-manger"
}

resource "aws_secretsmanager_secret_version" "secretsmanagerversion" {
  secret_id     = aws_secretsmanager_secret.secretsmanager.id
  secret_string =tls_private_key.key.private_key_pem
}
output "instance_id" {
  value = aws_instance.public_ec2.id
}

output "secretsmanager_secret" {
  value = aws_secretsmanager_secret.secretsmanager.id
}

output "secretsmanager_secret_version" {
  value = aws_secretsmanager_secret_version.secretsmanagerversion.id
}