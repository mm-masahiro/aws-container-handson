variable aws_vpc_id {}

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