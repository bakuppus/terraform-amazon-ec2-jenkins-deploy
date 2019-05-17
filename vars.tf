variable "name" {
  description = "jhipster demo."
  default = "jhipster"
}
# AWS Config

variable "aws_access_key" {
  default = "AKIAIXXXXXXXXFUJA"
}

variable "aws_secret_key" {
  default = "jU3OYuqXXXXXXXXXXcSQpkoGZ0n"
}

variable "aws_region" {
  default = "us-east-1"
}


variable "instance_type" {
  description = "AWS instance type to launch on."
  default = "t2.small"
}

variable "disk_size" {
  description = "Disk size in GB for the instance."
  default     = 10
}

variable "aws_key_path" {
  default = "/root/Amazon-Linux-TF/dexxxxc2-keypair.pem" 
}

variable "key_pair" {
  description = "Name of key pair to attach to the  instance."
  default = "dexxxxc2-keypair"
}

