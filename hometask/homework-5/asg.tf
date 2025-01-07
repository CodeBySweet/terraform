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

  /* 
 Added a dynamic block to handle tags dynamically, avoiding the need to define multiple tags explicitly.
 This iterates over the `var.tags` variable, allowing the specification of multiple tags in a structured format.
 Each tag includes a key, value, and the `propagate_at_launch` property.
 */
  dynamic "tag" {
    for_each = var.tags
    content {
      key                 = tag.value.key
      value               = tag.value.value
      propagate_at_launch = tag.value.propagate_at_launch
    }
  }

}


