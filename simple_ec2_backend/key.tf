resource "tls_private_key" "line_server_key" {      // keypair 생성 
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "aws_key_pair" "line_keypair" {
  key_name   = "line_key"                                           
  public_key = tls_private_key.line_server_key.public_key_openssh
}


resource "local_file" "line_server_download_key" {
  filename = format("keyfile_%s.pem", formatdate("YYYY-MM-DD", timestamp()))
  content  = tls_private_key.line_server_key.private_key_pem
}