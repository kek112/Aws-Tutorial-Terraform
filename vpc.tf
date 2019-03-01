resource "aws_vpc" "main" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "dedicated"

  tags = {
    Name = "edx-build-aws-vpc"
  }
}