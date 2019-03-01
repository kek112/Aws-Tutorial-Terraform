data "aws_ami" "amzn2" {
  most_recent = true

  filter {
    name = "name"
    values = [
      "amzn2-ami-hvm-*-x86_64-ebs"]
  }

  owners = [
    "amazon"]
}

resource "aws_instance" "web" {
  ami = "${data.aws_ami.amzn2.id}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.edx-subnet-public-a.id}"
  key_name = "${aws_key_pair.karl.key_name}"
  vpc_security_group_ids = [
    "${aws_security_group.ec2_web.id}"]

  tags = {
    Name = "terraform-instance"
  }
}
