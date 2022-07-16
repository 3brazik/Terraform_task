resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}a"
  tags = {
    Name = "subnet-public-1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}b"
  tags =  {
    Name = "subnet-public-2"
  }
}
resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "${var.region}a"
  tags =  {
    Name = "subnet-private-1"
  }
}
resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "${var.region}b"
  tags =  {
    Name = "subnet-private-2"
  }
}
