resource "aws_security_group" "ssh_and_port3000" {
  vpc_id = aws_vpc.myvpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    // This means, all ip address are allowed to ssh ! 
    // Do not do it in the production. 
    // Put your office or home address in it!
    cidr_blocks = ["10.0.0.0/16"]
  }
   ingress {
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = ["10.0.0.0/16"]
    }
  tags  = {
    Name = "ssh-allowed"
  }
}