resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.env == "prod" ? var.instance_type[1] : var.instance_type[0]
  user_data     = file("./extras/userdata.sh")

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    { Name = format(local.Name, "ec2") },
    local.common_tags
  )

  vpc_security_group_ids = [aws_security_group.web.id]
}


# Name       = "${var.cloud}-${var.region}-${var.team}-${var.env}-${var.app_tier}-${var.resource_type}"

//aws-usw2-devops-dev-skylight-backend-s3

/*
Tagging Standards
1. Environment: dev, qa
2. Department: finance, marketing, hr
3. Team: devops, finance
4. Project: skylight
5. ManagedBy: terraform, cloudformation, manual
6. Owner: Shirin
*/

