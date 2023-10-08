terraform {
  cloud {
    organization = "tomiwa-terraform-bootcamp-2023"
    workspaces {
      name = "tomiwa-terra-house-1"
    }
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.19.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_s3_bucket" "test-bucket" {
  bucket = var.bucket_name
}