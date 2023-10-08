resource "aws_s3_bucket" "test-bucket" {
  bucket = var.bucket_name
}