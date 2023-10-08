resource "random_string" "bucket_name" {
  length           = 16
  special          = false
}

resource "aws_s3_bucket" "test-bucket" {
  bucket = var.bucket_name
}