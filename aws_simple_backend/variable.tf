variable "region" {
  description = "The AWS region to create resources in."
  default     = "ap-northeast-2"
}

variable "aws_acm_certificate_backend" {
    description = "acm https certificate, attached to backend lb"
    default = "arn:aws:acm:ap-northeast-2:550776679428:certificate/1609f322-4cd6-44d7-a2ab-6b35d04d82cc"
}

variable "aws_azs" {
    description = "availability zone"
}
variable "aws_public_subnet" {
    description = "public subnet"
}
variable "aws_private_subnet" {
    description = "private subnet"
}