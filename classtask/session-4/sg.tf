resource "aws_security_group" "web" {
  name        = "MySG"
  description = "Session-3 SG"

  tags = {
    Name = "${var.security_group_name}"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress_rules" {
  count = length(var.ports)
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = var.cidrs[count.index]
  from_port         = var.ports[count.index]
  ip_protocol       = "tcp"
  to_port           = var.ports[count.index]
}

# resource "aws_vpc_security_group_ingress_rule" "ingress_rules" {
#   count = length(var.ports)
#   security_group_id = aws_security_group.web.id
#   cidr_ipv4         = element(var.cidrs,count.index)
#   from_port         = element(var.ports,count.index)
#   ip_protocol       = "tcp"
#   to_port           = element(var.ports,count.index)
# }

# resource "aws_vpc_security_group_ingress_rule" "ssh_ingress" {
#   security_group_id = aws_security_group.web.id
#   cidr_ipv4         = "0.0.0.0/0"
#   from_port         = 22
#   ip_protocol       = "tcp"
#   to_port           = 22
# }


# resource "aws_vpc_security_group_ingress_rule" "http_ingress" {
#   security_group_id = aws_security_group.web.id
#   cidr_ipv4         = "0.0.0.0/0"
#   from_port         = 80
#   ip_protocol       = "tcp"
#   to_port           = 80
# }




resource "aws_vpc_security_group_egress_rule" "all_open" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}



/*
1. create var "ports": 22, 80
2. use length
3. dynamically create sg ingress rule
*/