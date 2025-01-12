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
  type        = string
  default     = "Dev"
  description = "This is My Dev Environment"
}