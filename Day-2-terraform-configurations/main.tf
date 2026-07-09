resource "aws_vpc" "main" {
    cidr_block           = var.vpc_cidr_block
    enable_dns_support   = true
    enable_dns_hostnames = true

    tags = {
        Name = var.vpc_tag
    }
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id
    cidr_block              = var.public_cidr_block
    availability_zone       = var.availability_zone
    map_public_ip_on_launch = true

    tags = {
        Name = var.subnet_tag
    }
}

