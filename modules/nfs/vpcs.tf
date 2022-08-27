resource "aws_vpc" "virtual_cloud" {
  cidr_block = "192.168.0.0/16"

  tags = {
    Name = "Virtual Cloud"
  }
}
