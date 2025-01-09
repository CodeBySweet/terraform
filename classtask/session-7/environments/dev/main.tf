module "main" {
  // arguments (Required)
  source    = "../../modules/webserver"
  // variables (Optional)
  subnet_id = module.vpc.public_subnet_ids[0]
  my_vpc_id = module.vpc.vpc_id
}

module "vpc" {
  source = "../../modules/vpc"

  // variables
  env                 = "dev"
  vpc_name            = "My_VPC"
  security_group_name = "My-SG"
  subnets_az          = ["us-east-1a", "us-east-1b", "us-east-1c"]
  subnet_name         = [1, 2, 3]
}

/*
Sources:
1. local -> give a ppath to child module
2. Terraform regsitry
3. Remote (VCS, Github)

Reference module output:
module.<module_name>.<outputname>
*/