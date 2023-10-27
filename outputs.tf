output "aws_s3_bucket_website_bucket" {
  description = "bucket name for static website hosting"
  value = module.terrahouse_aws.bucket_name
}

output "s3_bucket_endpoint" {
  description = "s3 bucket static website endpoint"
  value = module.terrahouse_aws.website_endpoint
}

output "cdn_domain_name" {
  description = "cloudfront distribution domain name serving s3 bucket"
  value = module.terrahouse_aws.cdn_domain_name
}
