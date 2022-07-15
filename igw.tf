resource "aws_internet_gateway" "internet_geteway" {
  vpc_id = aws_vpc.myvpc.id

}