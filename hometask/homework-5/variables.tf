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
  description = "This is VPC"
}

# Security Group Name Variable
variable "security_group_name" {
  type        = string
  default     = "VPC-SG"
  description = "This is VPC Security Group"
}

# Public/Private Subnets' AZs
variable "subnets_az" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  description = "Public Subnets Avaialability Zones"
}

# Public/Private Subnets Name
variable "subnet_name" {
  type    = list(number)
  default = [1, 2, 3]
}

# Public Subnets CIDR Blocks
variable "public_subnet_cidr_block" {
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  description = "List of Public Subnets' CIDR Block"
}

# Private Subnets CIDR Blocks
variable "private_subnet_cidr_block" {
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
  description = "List of Private Subnets' CIDR Block"
}

# List of Ports
variable "sg_ports" {
  type        = list(number)
  default     = [22, 80, 443]
  description = "List of ports"
}

# List of Ports for ALB
variable "alb_ports" {
  type        = list(number)
  default     = [80, 443]
  description = "List of ALB ports"
}

# Application Load Balancer Name
variable "alb_name" {
  type        = string
  default     = "alb"
  description = "ALB Name"
}


#################### Naming and Tagging #################### 
variable "tags" {
  type = list(object({
    key                 = string
    value               = string
    propagate_at_launch = bool
  }))
  default = [{
    key                 = "cloud"
    value               = "aws"
    propagate_at_launch = true
    },
    {
      key                 = "region"
      value               = "use1"
      propagate_at_launch = true
    },
    {
      key                 = "Name"
      value               = "ASG"
      propagate_at_launch = true
    },
    {
      key                 = "team"
      value               = "DevOps"
      propagate_at_launch = true
    },
    {
      key                 = "project"
      value               = "ALB"
      propagate_at_launch = true
    },
    {
      key                 = "app_tier"
      value               = "Frontend"
      propagate_at_launch = true
  }]
}

variable "cloud" {
  default = "aws"
}

variable "region" {
  default = "use1"
}

variable "team" {
  default = "DevOps"
}

variable "project" {
  default = "ALB"
}

variable "app_tier" {
  default = "Frontend"
}

variable "resource_type" {
  default = "rtype"
}

variable "department" {
  default = "finance"
}

variable "managed_by" {
  default = "terraform"
}

variable "owner" {
  default = "Shirin"
}