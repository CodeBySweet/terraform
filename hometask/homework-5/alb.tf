############### Application Load Balancer ###############
resource "aws_lb" "alb-hm" {
  name               = "alb-homework-5"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = data.terraform_remote_state.network.outputs.public_subnet_ids[*]

  tags = merge(
    { Name = format(local.Name, "ALB-HM") },
    local.common_tags
  )
}


############### ALB's Target Group ###############
resource "aws_lb_target_group" "alb-tg" {
  name        = "alb-tg"
  target_type = "instance"
  port        = var.sg_ports[1]
  protocol    = "HTTP"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id
}


############### ALB's Listener ###############
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb-hm.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-tg.arn
  }
}


############### ALB's Security Group ###############
resource "aws_security_group" "alb-sg" {
  name        = "ALB-SG"
  description = "ALB SG"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id
  tags = merge(
    { Name = format(local.Name, "alb-sg") },
    local.common_tags
  )
}

# Inbound Rules for the ALB Security Group
resource "aws_security_group_rule" "alb_ingress" {
  count             = length(var.alb_ports)
  security_group_id = aws_security_group.alb-sg.id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = var.alb_ports[count.index]
  protocol          = "tcp"
  to_port           = var.alb_ports[count.index]
  type              = "ingress"
}

# ALB Security Group's Outbound Rules
resource "aws_security_group_rule" "alb_egress" {
  security_group_id = aws_security_group.alb-sg.id
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  type              = "egress"
}


############### Launch Template ###############
resource "aws_launch_template" "launch_template" {
  name          = "launch_template"
  image_id      = "ami-01816d07b1128cd2d"
  instance_type = "t2.micro"

  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = data.terraform_remote_state.network.outputs.public_subnet_ids[0]
    security_groups             = [aws_security_group.lt-sg.id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      { Name = format(local.Name, "launch-template") },
    local.common_tags)

  }
  user_data = filebase64("${path.module}/userdata.sh")
}


############### Launch Template's Security Group ###############
resource "aws_security_group" "lt-sg" {
  name        = "LT-SG"
  description = "LT SG"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id
  tags = merge(
    { Name = format(local.Name, "lt-sg") },
  local.common_tags)
}

# Inbound Rules for the Launch Template's Security Group
resource "aws_security_group_rule" "lt_ingress_rules" {
  security_group_id        = aws_security_group.lt-sg.id
  source_security_group_id = aws_security_group.alb-sg.id
  from_port                = var.sg_ports[1]
  protocol                 = "tcp"
  to_port                  = var.sg_ports[1]
  type                     = "ingress"
}

# Launch Template's Security Group's Outbound Rules
resource "aws_security_group_rule" "lt_egress_rules" {
  security_group_id = aws_security_group.lt-sg.id
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  type              = "egress"
}