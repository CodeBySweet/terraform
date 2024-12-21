output "vpc_id" {
  value = aws_vpc.my-vpc.id
}

output "vpc_sg_id" {
  value = aws_security_group.vpc-sg.id
}