provider "aws" {
  region = "eu-west-2"
}

terraform {
  backend "s3" {
    bucket = "ninitos-immaterial-net-terraform-state-bucket"
    key    = ".terraform"
    region = "eu-west-2"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidrs
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_instance" "centos_instance" {
  ami             = "ami-0aa938b5c246ef111"
  instance_type   = "t2.micro"
  key_name        = "dev.terraform.immaterial-net"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags            = {
    Name = "centos_instance"
  }
}