
variable "s3_bucket_names" {
  type = map(list(string))
  default = {
    session7 = [
      "my-s3-bucket-shirin-session7-a",
      "my-s3-bucket-shirin-session7-b",
      "my-s3-bucket-shirin-session7-c"
    ]
  }
}