resource "aws_internet_gateway" "virtual_igw" {
  vpc_id = aws_vpc.virtual_cloud.id

  tags = {
    Name = "Virtual Internet Gateway"
  }
}