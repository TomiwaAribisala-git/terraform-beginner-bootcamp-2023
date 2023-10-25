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

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  bucket_name = var.bucket_name
  content_version = var.content_version
}