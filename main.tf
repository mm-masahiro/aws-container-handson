variable aws_vpc_id {}
variable aws_route_table_id {}
variable aws_subnet_id_1a {}
variable aws_subnet_id_1c {}
variable aws_igw_id {}

resource "aws_vpc" "container_handson_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  instance_tenancy = "default"
  tags = {
    "Name" = "container_handson_vpc"
  }
}

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

# Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
  tags = {
    "Name" = "container_handson_internet_gateway"
  }
}

resource "aws_internet_gateway_attachment" "internet_gateway_attachment" {
  vpc_id = var.aws_vpc_id
  internet_gateway_id = var.aws_igw_id
}

# Security Group