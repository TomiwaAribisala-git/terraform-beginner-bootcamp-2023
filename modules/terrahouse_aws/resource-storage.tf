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
  content_type = "text/html"
  etag = filemd5("${path.root}/public/index.html")
  lifecycle {
    replace_triggered_by = [terraform_data.content_version]
    ignore_changes = [etag]
  }
}

resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.website-bucket.id
  key    = "error.html"
  source = "${path.root}/public/error.html"
  content_type = "text/html"
  etag = filemd5("${path.root}/public/error.html")
  lifecycle {
    replace_triggered_by = [terraform_data.content_version]
    ignore_changes = [etag]
  }
}

data "aws_iam_policy_document" "allow_access_from_cloudfront" {
  statement {
    principals {
      type = "cloudfront.amazonaws.com"
      identifiers = [aws_cloudfront_distribution.s3_distribution.id]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.website-bucket.arn,
      "${aws_s3_bucket.website-bucket.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_policy" "website-bucket-policy" {
  bucket = aws_s3_bucket.website-bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_cloudfront.json
}

resource "terraform_data" "content_version" {
  input = var.content_version
}