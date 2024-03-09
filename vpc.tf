data "aws_availability_zones" "available" {
}

# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.2"
  # VPC Basic Details
  name                    = var.vpc_name
  cidr                    = var.vpc_cidr_block
  azs                     = data.aws_availability_zones.available.names
  private_subnets         = var.vpc_private_subnets
  public_subnets          = var.vpc_public_subnets
  map_public_ip_on_launch = var.map_public_ip_on_launch

  # Database Subnets
  create_database_subnet_group       = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  database_subnets                   = var.vpc_database_subnets

  #create_database_nat_gateway_route = true
  #create_database_internet_gateway_route = true

  # NAT Gateways - Outbound Communication
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }

  tags = {
    Owner       = "Enkidu"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-dev"
  }
}
