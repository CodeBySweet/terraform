resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  vpc_security_group_ids = [aws_security_group.web.id]
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  user_data = file("${path.module}/extras/userdata.sh")


  lifecycle {
    create_before_destroy = true
  }

  tags = (
    {Name = "${var.env}-webserver"}
  )
  
}

resource "aws_security_group" "web" {
  name        = "MySG"
  description = "Session-3 SG"
  vpc_id = var.my_vpc_id

  tags = merge(
    { Name =  "my-sg"}
   
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

