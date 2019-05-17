# Copyright 2019. All rights reserved.

resource "aws_security_group" "default" {
  name        = "jhipster-sg"
  description = "jhipster security group"
  #vpc_id      = "vpc-b7407ed3"

  ingress {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      description = "postgresql ports"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "jenkins ports"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port   = 9200
      to_port     = 9200
      protocol    = "tcp"
      description = "elasticsearch ports"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port   = 8082
      to_port     = 8082
      protocol    = "tcp"
      description = "jhipster ports"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  
   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }   
  
  
  tags {
    Name = "jhipster-sg"
  }
}

resource "aws_instance" "my-test-instance" {
  ami             = "${data.aws_ami.amazon_linux.id}"
  instance_type   = "t3.large"
  vpc_security_group_ids = ["${aws_security_group.default.id}"] 
  key_name               = "${var.key_pair}"
 
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = "${var.disk_size}"
    volume_type           = "gp2"
    delete_on_termination = true
    encrypted             = true
  }

  tags {
    Name = "dorapos-${var.name}-prod"
  }



provisioner "file" {
    source      = "install-jenkins.sh"
    destination = "/tmp/install-jenkins.sh"
    connection {
      user = "ec2-user"
      private_key = "${file(var.aws_key_path)}"
      agent = "false" 
      timeout = "30s"
  }
 }


provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/install-jenkins.sh",
      "sudo  /tmp/install-jenkins.sh"
    ]
     connection = {
     type = "ssh"
     user = "ec2-user"
      private_key = "${file(var.aws_key_path)}"      
      timeout = "30s"

  }
 }
 
}


