resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"    
    
    enable_dns_support = true
    enable_dns_hostnames = true  
}


resource "aws_subnet" "public_sub" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.10.0/24"
    availability_zone = "ap-northeast-2a"
    map_public_ip_on_launch = true
    tags = { 
        Name = "line-public-subnet1"
        }
}