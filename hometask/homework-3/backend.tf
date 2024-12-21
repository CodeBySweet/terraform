terraform {
  backend "s3" {
    bucket = "terraform-homework-3-shirin"
    key    = "hometask/homework-3/terrafrom.tfstate"
    region = "us-east-1"
  }
}