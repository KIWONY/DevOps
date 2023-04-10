
resource "aws_security_group" "load_balancer" {
  name = "lb"
  description = "allow all traffic"
  vpc_id = aws_vpc.main.id
  
  ingress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "alb_security_group"
  }
}


resource "aws_security_group" "backend" {
  name = "backend"
  description = "allow 8080 from lb"
  vpc_id = aws_vpc.main.id
  
  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "backend_security_group"
  }
}


