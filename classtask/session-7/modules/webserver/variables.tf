

variable "env" {
  type        = string
  default     = "dev"
  description = "This is My Dev Environment"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "This is Instance Type"
}

variable "subnet_id" {
  description = "This is option for subnet"
  type = string
}

variable "my_vpc_id" {
  description = "This is my VPC ID" 
  type = string
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

