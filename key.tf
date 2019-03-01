resource "aws_key_pair" "karl" {
  key_name   = "karl"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}