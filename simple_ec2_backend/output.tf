output "instance_publicip" {
  value = aws_instance.test_server.public_ip
}

output "instance_public_dns" {
  value = aws_instance.test_server.public_dns
}