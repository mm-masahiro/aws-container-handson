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
