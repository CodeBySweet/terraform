
# Security Group for the VPC
resource "aws_security_group" "vpc-sg" {
  name        = "VPC-SG"
  description = "Homework-3 SG"
  vpc_id      = aws_vpc.my-vpc.id

  tags = {
    Name = var.security_group_name
    Env  = var.env
  }
}

# Inbound Rules for the Security Group
resource "aws_vpc_security_group_ingress_rule" "http_ingress" {
  security_group_id = aws_security_group.vpc-sg.id
  cidr_ipv4         = aws_vpc.my-vpc.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "ssh_ingress" {
  security_group_id = aws_security_group.vpc-sg.id
  cidr_ipv4         = aws_vpc.my-vpc.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# Security Group's Outbound Rules
resource "aws_vpc_security_group_egress_rule" "all_open" {
  security_group_id = aws_security_group.vpc-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}