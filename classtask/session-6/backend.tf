terraform {
  backend "s3" {
    bucket = "terraform-aug24-shirin"
    key    = "classtask/session-6/terraform.tfstate"
    region = "us-east-1"
  }
}