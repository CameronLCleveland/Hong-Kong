# Define the Hong Kong VPC (CIDR: 10.105.0.0/16)
resource "aws_vpc" "Hong-Kong_vpc" {
  cidr_block = "10.105.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

# Define subnets in Hong Kong VPC
resource "aws_subnet" "Hong-Kong_subnet_1" {
  vpc_id = aws_vpc.Hong-Kong_vpc.id
  cidr_block = "10.105.1.0/24"
  availability_zone = "ap-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Hong-Kong-Subnet-1"
  }
}

resource "aws_subnet" "Hong-Kong_subnet_2" {
  vpc_id = aws_vpc.Hong-Kong_vpc.id
  cidr_block = "10.105.3.0/24"
  availability_zone = "ap-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Hong-Kong-Subnet-2"
  }
}

# Define the Japan VPC (CIDR: 10.100.0.0/16)
resource "aws_vpc" "japan_vpc" {
  cidr_block = "10.100.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

# Define subnets in Japan VPC
resource "aws_subnet" "japan_subnet_1" {
  vpc_id = aws_vpc.japan_vpc.id
  cidr_block = "10.100.1.0/24"
  availability_zone = "ap-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Japan-Subnet-1"
  }
}

resource "aws_subnet" "japan_subnet_2" {
  vpc_id = aws_vpc.japan_vpc.id
  cidr_block = "10.100.3.0/24"
  availability_zone = "ap-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Japan-Subnet-2"
  }
}

resource "aws_subnet" "japan_subnet_3" {
  vpc_id = aws_vpc.japan_vpc.id
  cidr_block = "10.100.5.0/24"
  availability_zone = "ap-east-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "Japan-Subnet-3"
  }
}

# Define the VPC Peering Connection between Hong Kong and Japan
resource "aws_vpc_peering_connection" "hk_to_japan" {
  vpc_id = aws_vpc.Hong-Kong_vpc.id
  peer_vpc_id = aws_vpc.japan_vpc.id
  auto_accept = false

  tags = {
    Name = "Hong-Kong-to-Japan-Peering"
  }
}

# Accept the VPC peering connection from the Japan side
resource "aws_vpc_peering_connection_accepter" "accept_hk_to_japan" {
  vpc_peering_connection_id = aws_vpc_peering_connection.hk_to_japan.id
  auto_accept = true
}