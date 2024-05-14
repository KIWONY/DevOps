resource "tls_private_key" "line_server_key" {      // keypair 생성 
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "aws_key_pair" "line_keypair" {
  key_name   = "line_key"                                           
  public_key = tls_private_key.line_server_key.public_key_openssh
}

resource "local_file" "line_server_download_key" {    // 로컬에 저장 
  filename = "line_server_download_key.pem"
  content  = tls_private_key.line_server_key.private_key_pem
}