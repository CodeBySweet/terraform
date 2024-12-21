output "ec2_public_ip" {
  value       = aws_instance.web[0].public_ip
  description = "This is my public IP"
}

output "private_ip_qa" {
  value = aws_instance.web[1].private_ip
}

output "arn_prod_instance" {
  value = aws_instance.web[2].arn
}

output "stage_instance_id" {
  value = aws_instance.web[3].id
}

output "az_all_instances" {
  value = aws_instance.web[*].availability_zone
}

output "default_vpc_arn" {
  value = data.aws_vpc.default_vpc.arn
}

output "sg_id" {
  value = aws_security_group.web.id
}

# /*
# Outputs
# - outputting any attribute of resource OR data source

# */