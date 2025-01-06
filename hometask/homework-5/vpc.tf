############## VPC ##############
resource "aws_vpc" "my-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = merge(
    { Name = format(local.Name, "my-vpc") },
  local.common_tags)

}
