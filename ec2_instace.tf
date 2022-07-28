# Create a EC2 Instance (Ubuntu 20)
resource "aws_instance" "public_ec2" {
  instance_type          = "t2.micro" # free instance
  ami                    = var.ami_id
  key_name               = aws_key_pair.key_pair.id
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
  subnet_id              = module.network.public_subnet_1_id

  tags = {
    Name = "bastion-ec2"
  } 
  provisioner "local-exec" {
    command = "echo ${self.public_ip}"
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
  subnet_id              = module.network.private_subnet_2_id

  tags = {
    Name = "application-ec2"
  }
}
