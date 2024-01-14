output "amazon_linux_node_ssh_command" {
  description = "The SSH command to connect to the Amazon Linux node"
  value       = "ssh -i ${local_file.amazon_linux_node_ssh_key.filename} ec2-user@${aws_instance.amazon_linux_node.public_ip}"
}