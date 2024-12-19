resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  tags = {
    Name = "${var.instance_name}-${var.env}"
    Env  = var.env
  }
  vpc_security_group_ids = [aws_security_group.web.id]
}

resource "aws_security_group" "web" {
  name        = "MySG"
  description = "Session-3 SG"

  tags = {
    Name = "${var.security_group_name}-${var.env}"
    Env  = var.env
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh_ingress" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}


resource "aws_vpc_security_group_egress_rule" "all_open" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}



/*
Reference:
1. Resource Attribute reference -> Implicit Dependency
     PROVIDER_TYPE.LogicalID.Attribute.id
     first_label.second_label_attr

2. Variable refernce
   var.variablename

3. Data source reference
   data.first_label.second_label.attr

PORT = application -> http/https/ftp/ssh
PROTOCOL = transport -> tcp, icmp, udp

Data Types:
[] - list
{} - Map
"" - double quotation
bool/numbers = nothing

String Interpolation = a method of embedding variable value 

VARIABLES:
1. In config file, give default value
2. Give value in command line: terraform apply var=instance_type=t2.micro
3. Environment Variable: TF_VAR_variable_name

*/