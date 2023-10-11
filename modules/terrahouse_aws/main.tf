resource "aws_s3_bucket" "website-bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_website_configuration" "website-bucket-configuration" {
  bucket = aws_s3_bucket.website-bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website-bucket.id
  key    = "index.html"
  source = "${path.root}/public/index.html"
  etag = filemd5("${path.root}/public/index.html")
}

resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.website-bucket.id
  key    = "error.html"
  source = "${path.root}/public/error.html"
  etag = filemd5("${path.root}/public/error.html")
}