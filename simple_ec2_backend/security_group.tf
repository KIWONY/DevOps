resource "aws_security_group" "ssh_sg_group" {
    vpc_id = aws_vpc.vpc.id
    name = "ssh-sg-group"
    description = "terraform line ssh security group"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"             // 특정 프로토콜 지정 안 함 
        cidr_blocks = ["0.0.0.0/0"]             
    }
}