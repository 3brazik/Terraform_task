resource "aws_security_group" "alb_sg" {
  name        = "alb sg"
  description = "alb sg"
  vpc_id      = module.network.vpc_id

  ingress {
    description = "80 from everywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "alb_sg"
  }
}

resource "aws_security_group" "elastic-cache-sg" {
  name        = "allow 6379"
  description = "Allow 6379 inbound traffic"
  vpc_id      = module.network.vpc_id

  ingress {
    description = "6379 from everywhere"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "elastic-cache-terra_public"
  }
}


resource "aws_security_group" "rds_sg" {
  name        = "allow 3306"
  description = "Allow 3306"
  vpc_id      = module.network.vpc_id

  ingress {
    description = "3306 from vpc"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "rds_sg"
  }
}
