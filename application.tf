resource "aws_subnet" "application_subnet_1a" {
  vpc_id = var.aws_vpc_id
  availability_zone = "ap-northeast-1a"
  cidr_block = "10.0.8.0/24"
  map_public_ip_on_launch = false

  tags = {
    "Name" = "application_subnet_1a",
    "Type" = "Isolated"
  }
}

resource "aws_subnet" "application_subnet_1c" {
  vpc_id = var.aws_vpc_id
  availability_zone = "ap-northeast-1c"
  cidr_block = "10.0.9.0/24"
  map_public_ip_on_launch = false

  tags = {
    "Name" = "application_subnet_1c",
    "Type" = "Isolated"
  }
}

resource "aws_route_table" "application_route_table" {
  vpc_id = var.aws_vpc_id
  tags = {
    "Name" = "application_route_table"
  }
}

resource "aws_route_table_association" "application_route_table_association_1a" {
  route_table_id = var.aws_route_table_id
  subnet_id = var.aws_subnet_id_1a
}

resource "aws_route_table_association" "application_route_table_association_1c" {
  route_table_id = var.aws_route_table_id
  subnet_id = var.aws_subnet_id_1c
}
