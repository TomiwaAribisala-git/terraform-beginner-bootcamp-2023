output "random_bucket_name_id" {
  value = random_string.bucket_name.id
}

output "aws_s3_bucket_test_bucket" {
  value = aws_s3_bucket.tomiwa-test-bucket.id
}