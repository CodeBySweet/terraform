
data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "terraform-homework-shirin"
    key    = "hometask/homework-4/terrafrom.tfstate"
    region = "us-east-1"
  }
}
