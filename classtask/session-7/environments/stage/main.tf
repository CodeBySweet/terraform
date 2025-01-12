
module "vpc" {
  source = "github.com/CodeBySweet/tf-modules//vpc?ref=v1.0.0"

  // variables
  env                 = "dev"
  vpc_name            = "My_VPC"
  security_group_name = "My-SG"
  subnets_az          = ["us-east-1a", "us-east-1b", "us-east-1c"]
  subnet_name         = [1, 2, 3]
}


/*

?ref=v1.0.0
?ref=COMMIT_HASH
?ref=BRANCH_NAME

*/