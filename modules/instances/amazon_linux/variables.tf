variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
}

variable "security_group_ids" {
  description = "Security group IDs to attach to the instance"
  type        = list(string)
}

variable "instance_name" {
  description = "The name of the instance"
  type        = string
}