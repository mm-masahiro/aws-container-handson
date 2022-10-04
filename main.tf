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
resource "aws_security_group" "name" {
  ingress = [{
    cidr_blocks = ["0.0.0.0/0"]
    description = "from 0.0.0.0/0:80"
    from_port = 80
    protocol = "tcp"
    to_port = 80
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids = []
    security_groups = []
    self = false
  }]

  # ingress = [ {
  #   cidr_blocks = [ "value" ]
  #   description = "value"
  #   from_port = 1
  #   protocol = "value"
  #   to_port = 1
  #   ipv6_cidr_blocks = [ "value" ]
  #   prefix_list_ids = [ "value" ]
  #   security_groups = [ "value" ]
  #   self = false
  # } ]

  egress = [{
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic by default"
    protocol = "-1"
    from_port = 0
    to_port = 0
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false
  }]

  vpc_id = var.aws_vpc_id
 tags = {
  "Name" = "container_handson_security_group"
 } 
}