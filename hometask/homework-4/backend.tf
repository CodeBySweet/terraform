terraform {
  backend "s3" {
    bucket = "terraform-homework-4-shirin"
    key    = "hometask/homework-4/terrafrom.tfstate"
    region = "us-east-1"
  }
}