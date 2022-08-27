resource "aws_security_group" "virtual_security_group_1" {
  vpc_id = aws_vpc.virtual_cloud.id

  dynamic "ingress" {
    for_each = var.nfs_ports_ingress
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Virtual Security Group 1"
  }
}
