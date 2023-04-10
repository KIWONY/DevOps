resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    enable_dns_support = true
    enable_dns_hostnames = true  

}

resource "aws_subnet" "public_a" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-northeast-2a"
    map_public_ip_on_launch = true
}

resource "aws_subnet" "public_b" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-northeast-2c"
    map_public_ip_on_launch = true
}

resource "aws_subnet" "private_a" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.10.0/24"
    availability_zone = "ap-northeast-2a"
    map_public_ip_on_launch = true
}
resource "aws_subnet" "private_b" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.11.0/24"
    availability_zone = "ap-northeast-2c"
    map_public_ip_on_launch = true
}

# 인터넷 게이트웨이 
resource "aws_internet_gateway" "gateway" {
    vpc_id = aws_vpc.main.id
}













