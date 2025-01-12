terraform {
  backend "s3" {
    bucket = "terraform-aug24-shirin"
    key    = "classtask/session-8/terraform.tfstate"
    region = "us-east-1"
  }
}