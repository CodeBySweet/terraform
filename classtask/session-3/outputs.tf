output "ec2_public_ip" {
  value = aws_instance.web.public_ip
  description = "This is my public IP"
}

output "default_vpc_arn" {
  value = data.aws_vpc.default_vpc.arn
}

output "sg_id" {
  value = aws_security_group.web.id
}

/*
Outputs
- outputting any attribute of resource OR data source

*/