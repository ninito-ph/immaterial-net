output "instance_ssh_command" {
  description = "SSH command to connect to the instance"
  value = module.amazon_linux_node.amazon_linux_node_ssh_command
}