output "bucket_name" {
  value = aws_s3_bucket.website-bucket.bucket
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.website-bucket-configuration.website_endpoint
}