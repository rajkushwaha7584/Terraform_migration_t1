variable "region" {
  description = "AWS region in which resources are created."
  type        = string

  validation {
    condition     = can(regex("^[a-z]{2}-[a-z]+-[0-9]+$", var.region))
    error_message = "region must be a valid AWS region identifier, for example us-east-1."
  }
}

variable "instance_type" {
  description = "EC2 instance type to create."
  type        = string

  validation {
    condition     = can(regex("^[a-z][a-z0-9]*\\.[a-z0-9]+$", var.instance_type))
    error_message = "instance_type must be a valid EC2 instance type, for example t3.micro."
  }
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance. It must exist in the selected AWS region."
  type        = string
  default     = "ami-0b6d9d3d33ba97d99"
}

variable "vpc_security_group_ids" {
  description = "Security groups to attach to the EC2 instance. Supply groups with only required ingress and egress rules."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags applied to all resources that support provider default tags."
  type        = map(string)

  default = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
    Project     = "Terraform-migration-t1"
  }
}
