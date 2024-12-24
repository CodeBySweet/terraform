# Configure the AWS Provider
provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["/Users/shirinz/.aws/credentials"]
  profile                  = "default"
}

provider "aws" {
  alias                    = "ohio"
  region                   = "us-east-2"
  shared_credentials_files = ["/Users/shirinz/.aws/credentials"]
  profile                  = "default"
}