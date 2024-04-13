resource "aws_eip" "gateway" {
    vpc = true
    depends_on = [aws_internet_gateway.gateway]
}

resource "aws_nat_gateway" "nat" {
    subnet_id = aws_subnet.public_a.id
    allocation_id = aws_eip.gateway.id
}


# 라우팅 테이블
resource "aws_route" "internet_access" {
    route_table_id = aws_vpc.main.main_route_table_id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
}

resource "aws_route_table" "connect" {
    vpc_id = aws_vpc.main.id 

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat.id
    }
}

resource "aws_route_table_association" "private" {
    subnet_id = aws_subnet.private_a.id
    route_table_id = aws_route_table.connect.id
}

resource "aws_route_table_association" "private_2" {
    subnet_id = aws_subnet.private_b.id
    route_table_id = aws_route_table.connect.id
}






