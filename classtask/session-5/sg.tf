resource "aws_security_group" "web" {
  name        = "MySG"
  description = "Session-3 SG"


  tags = merge(
    { Name = format(local.Name, "sg") },
    local.common_tags
  )
}

resource "aws_vpc_security_group_ingress_rule" "ingress_rules" {
  count             = length(var.ports)
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = var.cidrs[count.index]
  from_port         = var.ports[count.index]
  ip_protocol       = "tcp"
  to_port           = var.ports[count.index]
}


resource "aws_vpc_security_group_egress_rule" "all_open" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
