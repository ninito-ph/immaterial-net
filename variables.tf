variable "allowed_ssh_cidrs" {
  description = "List of CIDR blocks to allow SSH access from"
  type        = list(string)
}