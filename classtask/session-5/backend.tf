terraform {
  backend "s3" {
    bucket = "terraform-aug24-shirin"
    key    = "classtask/session-5/terrafrom.tfstate"
    region = "us-east-1"
  }
}