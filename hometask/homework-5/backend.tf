terraform {
  backend "s3" {
    bucket = "terraform-homework-shirin"
    key    = "hometask/homework-5/terraform.tfstate"
    region = "us-east-1"
  }
}