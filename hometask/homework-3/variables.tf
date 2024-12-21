# Environment Variable
variable "env" {
  type        = string
  default     = "Dev"
  description = "This is My Dev Environment"
}

# VPC Name Variable
variable "vpc_name" {
  type        = string
  default     = "My-VPC"
  description = "This is Homework-3 VPC"
}

# Security Group Name Variable
variable "security_group_name" {
  type        = string
  default     = "VPC-SG"
  description = "This is Homework-3 Security Group"
}