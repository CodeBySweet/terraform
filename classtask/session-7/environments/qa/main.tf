module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  for_each = toset(var.s3_bucket_names["session7"])
  bucket   = each.key
  acl      = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}



/*

ClassTask

cretae 3 S3 buckets with for_each

1. create var - S3-bucket-names
2. for_each, each, key

*/