provider "aws" {
    region = "ap-northeast-2"
    access_key = "<ACCESS KEY>"
    secret_key = "<SECRET KEY>"
}

resource "aws_instance" "vision_test_server" {
    ami           = "<ami ID>"
    instance_type = "t3.small"
    vpc_security_group_ids = ["<security group ID"]
    associate_public_ip_address = true
    key_name = "<key pair name>"

    subnet_id = "<subnet ID>"

    tags = {
      Name = "test-server"
  }
}

