############### Auto Scaling Group ###############
resource "aws_autoscaling_group" "asg-hm" {
  name             = "ASG-HM"
  max_size         = 3
  min_size         = 1
  desired_capacity = 2

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }

  vpc_zone_identifier       = data.terraform_remote_state.network.outputs.private_subnets_ids[*]
  target_group_arns         = [aws_lb_target_group.alb-tg.arn]
  health_check_grace_period = 300
  health_check_type         = "ELB"

  tag {
    key                 = "Name"
    value               = "ASG Instance"
    propagate_at_launch = false
  }

}