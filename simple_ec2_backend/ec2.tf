resource "aws_instance" "test_server" {
    ami           = "ami-09a7535106fbd42d5"
    instance_type = "t3.small"
    // vpc_security_group_ids = ["<security group ID"]
    associate_public_ip_address = true
    key_name = aws_key_pair.line_keypair.key_name       //public key

    subnet_id = aws_subnet.public_sub.id

    provisioner "file" {               // script.sh 업로드 
        source = "script.sh"
        destination = "/scsript.sh"
    }

    provisioner "remote-exec" {         // 스크립트 실행 
      inline = [ 
        "chmod +x script.sh",   // 권한 변경 
        "sudo /script.sh"  // arguments 붙여서 명령어 실행 
       ]
    }

    provisioner "local-exec" {
        command = "echo ${aws_instance.test_server.private_ip} >> private_ip.txt"
    }

    connection {        // 기본 ssh 연결
        host = self.public_ip
        user = "ubuntu"
        private_key ="${file("${local_file.line_server_download_key.filename}")}"
        //private_key = "${file("${var.PRIVATE_KEY}")}"   // 파일명 
        // ssh를 통해 인스턴스에 로그인 &  script.sh 업로드
    }

    tags = {
        Name = "test-server"
    }
}

