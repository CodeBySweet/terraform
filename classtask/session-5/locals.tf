/*
Naming Standards
1. Cloud Provider: aws, gcp, etc
2. Region: uset1, usw2
3. Team: DevOps, QA
4. Environment: dev, qa, stage, prod
5. Project/Application Name: instagram, etc
6. Application Tier: backend, frontend
7. Resource Name: ec2, s3, rds 

EC2 instance:
aws-use1-devops-qa-skylight-frontend-ec2

S3 bucket:
aws-usw2-devops-dev-skylight-backend-s3
----------------------------------------------------------------

Tagging Standards
1. Environment: dev, qa
2. Department: finance, marketing, hr
3. Team: devops, finance
4. Project: skylight
5. ManagedBy: terraform, cloudformation, manual
6. Owner: Shirin

----------------------------------------------------------------
Ternary Syntax:
<condition> ? true_value : false_value
1 == 1 ? true : false (true)
1 == 2 ? true : false (false)
if env.prod instance.type = t2.medium
else instance_type = t2.micro

*/

locals {
  common_tags = {
    Env        = var.env
    Department = var.department
    Team       = var.team
    Project    = var.project
    ManagedBy  = var.managed_by
    Owner      = var.owner
  }
}

locals {
  Name = "${var.cloud}-${var.region}-${var.team}-${var.env}-${var.app_tier}-%s"
}

# locals {
#   Name       = "${var.cloud}-${var.region}-${var.team}-${var.env}-${var.app_tier}-rtype"
# }
