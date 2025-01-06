# Common tags
locals {
  common_tags = {
    Env          = var.env
    Department   = var.department
    Team         = var.team
    Project      = var.project
    ManagedBy    = var.managed_by
    Owner        = var.owner
    ResourceType = var.resource_type
  }
}

# Name
locals {
  Name = "${var.cloud}-${var.region}-${var.team}-${var.env}-${var.app_tier}-%s"
}