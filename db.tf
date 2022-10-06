resource "aws_subnet" "db_subnet_1a" {
  cidr_block = "10.0.16.0/24"
  vpc_id = var.aws_vpc_id
  availability_zone = "ap-northeast-1a"
  map_public_ip_on_launch = false
  tags = {
    "Name" = "db_private_subnet_1a"
    "Type" = "Isolated"
  }
}

resource "aws_subnet" "db_subnet_1c" {
  cidr_block = "10.0.17.0/24"
  vpc_id = var.aws_vpc_id
  availability_zone = "ap-northeast-1c"
  map_public_ip_on_launch = false
  tags = {
    "Name" = "db_private_subnet_1c"
    "Type" = "Isolated"
  }
}

resource "aws_route_table" "db_route_table" {
  vpc_id = var.aws_vpc_id
  tags = {
    "Name": "db_route_table"
  }
}

resource "aws_route_table_association" "db_route_table_association_1a" {
  route_table_id = var.aws_db_route_table_id
  subnet_id = var.aws_db_subnet_id_1a
}

resource "aws_route_table_association" "db_route_table_association_1c" {
  route_table_id = var.aws_db_route_table_id
  subnet_id = var.aws_db_subnet_id_1c
}