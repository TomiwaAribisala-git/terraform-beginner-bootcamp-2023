terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.19.0"
    }
  }
}

provider "random" {
  # Configuration options
}

provider "aws" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  length           = 16
  special          = false
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"
}

output "random_bucket_name_id" {
  value = random_string.bucket_name.id
}

output "aws_s3_bucket_example" {
  value = aws_s3_bucket.example.id
}
