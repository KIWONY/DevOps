resource "aws_internet_gateway" "line-gateway" {
    vpc_id = aws_vpc.vpc.id
    
}