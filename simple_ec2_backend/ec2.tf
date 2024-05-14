resource "aws_instance" "test_server" {
    ami           = "ami-09a7535106fbd42d5"
    instance_type = "t3.small"
    vpc_security_group_ids = ["${aws_security_group.ssh_sg_group.id}"]
    associate_public_ip_address = true
    key_name = "${aws_key_pair.line_keypair.key_name}"     //public key

    subnet_id = aws_subnet.public_sub.id
    
    provisioner "file" {               // script.sh 업로드 
        source = "script.sh"
        destination = "/tmp/script.sh"
        // ssh를 통해 인스턴스에 로그인 &  script.sh 업로드
    }
    

    provisioner "remote-exec" {         // 원격서버에서 명령 실행 
      inline = [ 
        "chmod +x /tmp/script.sh",   // 권한 변경 
        "sudo /tmp/script.sh"  // arguments 붙여서 명령어 실행 
       ]
    }

    provisioner "local-exec" {          // 로컬서버에서 명령 실행 
        command = "echo ${aws_instance.test_server.private_ip} >> private_ip.txt"
    }


    depends_on = [ aws_internet_gateway.line_gateway, aws_key_pair.line_keypair,
                    aws_route_table_association.route_table_association_1 ]
    tags = {
        Name = "line-server"
    }
    connection {        // 기본 ssh 연결
        host = self.public_ip
        user = "ubuntu"
        private_key = "${file(var.PRIVATE_KEY)}"
        //private_key = "${file("${var.PRIVATE_KEY}")}"   // 파일명 
    }
}

