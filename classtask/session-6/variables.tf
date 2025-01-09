variable "instance_type" {
  type        = list(string)
  default     = ["t2.micro", "t2.medium"]
  description = "This is Instance Type"
}

variable "instance_name" {
  type        = string
  default     = "My-Webserver"
  description = "This is My Webserver"
}

variable "security_group_name" {
  type        = string
  default     = "MySG"
  description = "This is My Security Group"
}

variable "env" {
  type        = string
  default     = "dev"
  description = "This is My Dev Environment"
}

variable "ports" {
  type        = list(number)
  default     = [22, 80, 443]
  description = "List of ports"
}

variable "cidrs" {
  type        = list(string)
  default     = ["73.74.183.123/32", "0.0.0.0/0", "0.0.0.0/0"]
  description = "List of CIDR "
}

variable "sg_rules" {
  type = map(object({
    from_port   = number
    to_port     = number
    cidr_ipv4   = string
    ip_protocol = string

  }))
  default = {
    http = {
      from_port   = 80
      to_port     = 80
      cidr_ipv4   = "0.0.0.0/0"
      ip_protocol = "tcp"
    }
    ssh = {
      from_port   = 22
      to_port     = 22
      cidr_ipv4   = "73.74.183.123/32"
      ip_protocol = "tcp"
    }
    https = {
      from_port   = 443
      to_port     = 443
      cidr_ipv4   = "0.0.0.0/0"
      ip_protocol = "tcp"
    }
  }
}


#################### Naming and Tagging #################### 
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
  default = "skylight"
}

variable "app_tier" {
  default = "Frontend"
}

variable "resource_type" {
  default = "ec2"
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


