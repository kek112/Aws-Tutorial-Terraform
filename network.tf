resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "edx-igw"
  }
}

resource "aws_subnet" "edx-subnet-public-a" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.1.1.0/24"
  availability_zone = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "edx-subnet-public-a"
  }
}

resource "aws_subnet" "edx-subnet-public-b" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.1.2.0/24"
  availability_zone = "eu-central-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "edx-subnet-public-b"
  }
}

resource "aws_subnet" "edx-subnet-private-a" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.1.3.0/24"
  availability_zone = "eu-central-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "edx-subnet-private-a"
  }
}
resource "aws_subnet" "edx-subnet-private-b" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.1.4.0/24"
  availability_zone = "eu-central-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "edx-subnet-private-b"
  }
}

resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    Name = "edx-routetable-public"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.edx-subnet-public-a.id}"
  route_table_id = "${aws_route_table.r.id}"
}

resource "aws_route_table_association" "b" {
  subnet_id      = "${aws_subnet.edx-subnet-public-b.id}"
  route_table_id = "${aws_route_table.r.id}"
}