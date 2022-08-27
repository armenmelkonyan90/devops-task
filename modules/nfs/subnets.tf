resource "aws_subnet" "virtual_subnet_1" {
  count  = var.subnet_count
  vpc_id = aws_vpc.virtual_cloud.id
  cidr_block = element(
    cidrsubnets(
      join(".", tolist([element(split(".", "${aws_vpc.virtual_cloud.cidr_block}"), 0),
        element(split(".", "${aws_vpc.virtual_cloud.cidr_block}"), 1),
        "${count.index}",
  element(split(".", "${aws_vpc.virtual_cloud.cidr_block}"), 3)])), 8), 0)
  map_public_ip_on_launch = true

  tags = {
    Name = "Virtual Subnet 1"
  }
}
