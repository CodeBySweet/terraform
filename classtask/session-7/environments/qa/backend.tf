terraform {
  backend "s3" {
    bucket = "terraform-aug24-shirin"
    key    = "classtask/session-7/modules/qa/terraform.tfstate"
    region = "us-east-1"
  }
}