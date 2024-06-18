provider "aws" {
  region = "us-east-1"
}

variable "aws_access_key"{
}
variable "aws_secret" {
}

variable "s3_buckets" {
  description = "List of S3 buckets with their attributes"
  type = list(object({
    name = string
    acl  = string
  }))
  default = [
    {
      name = "example-a1"
      acl  = "private"
    },
    {
      name = "example-b1"
      acl  = "private"
    },
    {
      name = "example-c1"
      acl  = "private"
    }
  ]
}

resource "aws_s3_bucket" "a1" {
  bucket = var.s3_buckets[0].name
  acl    = var.s3_buckets[0].acl
}

resource "aws_s3_bucket" "b1" {
  bucket = var.s3_buckets[1].name
  acl    = var.s3_buckets[1].acl
}

resource "aws_s3_bucket" "c1" {
  bucket = var.s3_buckets[2].name
  acl    = var.s3_buckets[2].acl
}


output "c1_bucket_details" {
  value = lookup(resource.s3_buckets_map, "example-c1")
}
