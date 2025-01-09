resource "aws_security_group" "web" {
  name        = "MySG"
  description = "Session-3 SG"


  tags = merge(
    { Name = format(local.Name, "sg") },
    local.common_tags
  )
}

resource "aws_vpc_security_group_ingress_rule" "ingress_rules" {
  for_each          = var.sg_rules
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = each.value.cidr_ipv4
  from_port         = each.value.from_port
  ip_protocol       = each.value.ip_protocol
  to_port           = each.value.to_port
  tags = {
    Name = each.key
  }
}


resource "aws_vpc_security_group_egress_rule" "all_open" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}



# resource "aws_vpc_security_group_ingress_rule" "ingress_rules" {
#   count             = length(var.ports)
#   security_group_id = aws_security_group.web.id
#   cidr_ipv4         = var.cidrs[count.index]
#   from_port         = var.ports[count.index]
#   ip_protocol       = "tcp"
#   to_port           = var.ports[count.index]
# }


# resource "aws_vpc_security_group_egress_rule" "all_open" {
#   security_group_id = aws_security_group.web.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1"
# }
