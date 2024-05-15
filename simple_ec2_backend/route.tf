resource "aws_route" "public_route" {
  route_table_id = aws_route_table.terraform_public_route.id
  destination_cidr_block = "0.0.0.0/0"    // 나가는 블럭 
  gateway_id = aws_internet_gateway.line_gateway.id
}


resource "aws_route_table" "terraform_public_route" {
  vpc_id = aws_vpc.vpc.id

  tags = {
     Name = "terraform_line_route_table" }
}

resource "aws_route_table_association" "route_table_association_1" {
  subnet_id      = aws_subnet.public_sub.id
  route_table_id = aws_route_table.terraform_public_route.id
}