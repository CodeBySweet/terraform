module "main" {
  // arguments
  source = "../../modules/webserver"

  // variables
  instance_type = "t2.medium"
  env = "prod"
}


/*
Sources:
1. local -> give a ppath to child module
2. Terraform regsitry
3. Remote (VCS, Github)
*/