resource "tls_private_key" "node_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "node_key_pair" {
  key_name   = "${var.instance_name}_ssh_key"
  public_key = tls_private_key.node_key.public_key_openssh
}

resource "aws_instance" "amazon_linux_node" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = aws_key_pair.node_key_pair.key_name
  vpc_security_group_ids = var.security_group_ids
}

resource "local_file" "amazon_linux_node_ssh_key" {
  content  = tls_private_key.node_key.private_key_pem
  filename = "${var.instance_name}_ssh_key.pem"
}