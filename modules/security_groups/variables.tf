variable "allowed_ssh_cidr_blocks" {
  description = "List of CIDR blocks to allow SSH access from"
  type        = list(string)
}