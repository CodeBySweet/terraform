
# data "terraform_remote_state" "network" {
#   backend = "s3"

#   config = {
#     bucket = "terraform-homework-shirin"
#     key    = "hometask/homework-5/terraform.tfstate"
#     region = "us-east-1"
#   }
# }

# output "vpc_id" {
#   value = data.terraform_remote_state.network.outputs.vpc_id
# }

# output "private_subnet_ids" {
#   value = data.terraform_remote_state.network.outputs.private_subnets_ids
# }

# output "public_subnet_ids" {
#   value = data.terraform_remote_state.network.outputs.public_subnet_ids
# }