On Terraform code modify listed parameters

vars.tf
========

variable "aws_access_key" {
  default = "AKIAIXXXXXXXXFUJA"
}

variable "aws_secret_key" {
  default = "jU3OYuqXXXXXXXXXXcSQpkoGZ0n"
}

variable "aws_key_path" {
  default = "/root/Amazon-Linux-TF/dexxxxc2-keypair.pem" 
}

variable "key_pair" {
  description = "Name of key pair to attach to the  instance."
  default = "dexxxxxc2-keypair"

