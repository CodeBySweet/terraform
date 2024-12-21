variable "instance_type" {
  type        = string
  default     = "t2.micro"
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
  type        = list(string)
  default     = ["dev", "qa", "prod","stage"]
  description = "This is My Dev Environment"
}

variable "ports" {
  type = list(number)
  default = [22, 80, 443]
  description = "List of ports"
}

variable "cidrs" {
  type = list(string)
  default = ["73.74.183.123/32", "0.0.0.0/0", "0.0.0.0/0"]
  description = "List of CIDR "
}