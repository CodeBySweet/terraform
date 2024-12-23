
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
resource "aws_vpc_security_group_ingress_rule" "ingress_rules" {
  count             = length(var.sg_ports)
  security_group_id = aws_security_group.vpc-sg.id
  cidr_ipv4         = aws_vpc.my-vpc.cidr_block
  from_port         = var.sg_ports[count.index]
  ip_protocol       = "tcp"
  to_port           = var.sg_ports[count.index]
}

# Security Group's Outbound Rules
resource "aws_vpc_security_group_egress_rule" "all_open" {
  security_group_id = aws_security_group.vpc-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}