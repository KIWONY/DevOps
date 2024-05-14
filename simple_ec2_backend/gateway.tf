resource "aws_internet_gateway" "line_gateway" {
    vpc_id = aws_vpc.vpc.id
}