output "bucket_name" {
  value = aws_s3_bucket.website-bucket.bucket
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.website-bucket-configuration.website_endpoint
}

output "cdn_domain_name" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}