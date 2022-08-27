resource "aws_key_pair" "virtual_key_1" {
  key_name   = "virtual_key_1"
  public_key = file("./accessKey.pub")
}
