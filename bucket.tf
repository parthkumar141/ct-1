provider "aws" {
  region = "us-east-1"
}

locals {
  bucket_names = ["macbook", "mouse", "laptop", "parth", "dell"]
}

resource "aws_s3_bucket" "example_buckets" {
  count  = length(local.bucket_names)
  bucket = local.bucket_names[count.index]
}

output "parth_bucket_id" {
  value = lookup({ for b in aws_s3_bucket.example_buckets : b.bucket => b.id if b.bucket == "parth" }, "parth", "Bucket not found")
}
