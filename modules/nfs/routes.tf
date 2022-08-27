resource "aws_route_table" "virtual_route" {
  vpc_id = aws_vpc.virtual_cloud.id

  route {
    cidr_block = var.route_table_cidr_block
    gateway_id = aws_internet_gateway.virtual_igw.id
  }

  tags = {
    Name = "Virtual Route Table"
  }
}

resource "aws_route_table_association" "virtual_route_association" {
  count          = var.subnet_count
  subnet_id      = aws_subnet.virtual_subnet_1[count.index].id
  route_table_id = aws_route_table.virtual_route.id
}
