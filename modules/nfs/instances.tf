resource "aws_instance" "virtual_instance_1" {
  ami                    = "ami-0c9354388bb36c088"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.virtual_subnet_1[0].id
  vpc_security_group_ids = [aws_security_group.virtual_security_group_1.id]
  key_name               = aws_key_pair.virtual_key_1.key_name
  user_data              = file(var.user_data_path)

  tags = {
    Name = "NFS Instance"
  }
}
