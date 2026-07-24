variable "instance_type" {
  description = "EC2 instance type to create."
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance. It must exist in the selected AWS region."
  type        = string
  default     = "ami-0b6d9d3d33ba97d99"
}

variable "vpc_security_group_ids" {
  description = "Security groups to attach to the instance. Supply groups with only the required ingress and egress rules."
  type        = list(string)
  default     = []
}
