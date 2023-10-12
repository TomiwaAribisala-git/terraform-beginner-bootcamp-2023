# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure
Our root module structure is as follows: 
- PROJECT ROOT
    - main.tf: defines the main terraform project config
    - variables.tf: defines the structure of input variables
    - outputs.tf: defines outputs
    - providers.tf: defines required providers
    - terraform.tfvars: defines the data of variables to load for the terraform project config
    - README.md: required for root modules

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Loading Terraform Input Variables
- Prefarably set input variables values in the terraform.tfvars file, this is the default file to load terraform variables definitions in bulk.
- Furthur Reading: [Terraform Input Variales](https://developer.hashicorp.com/terraform/language/values/variables)

## Dealing With Configuration Drift

### What happens if one lose the statefile? 
If you lose your statefile, you most likely have to tear down your cloud infrastructure manually.

You can use `terraform import` but it won't cover all your cloud resources; You need to check the terraform providers documentation for which resources support `terraform import`. 

You can also use `terraform apply -refresh-only` to adjust your state file to the clickops done manually via the console.

### Fix Missing Resources with Terraform Import
[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)

### Fix Manual Configuration
- If someone goes and delete/modify cloud resources manually via the console.
- Run Terraform Plan with the attempt to put our infrastructure back into the expected state fixing Configuration Drift.


## Terraform Modules

### Terraform Module Structure
It is recommended to place modules in a `modules` directory when locally developing modules but you can name it whatever you like.

### Module Sources 
Using the source we can import the module from various sources eg. Locally, Github, Terraform Regristry etc
```
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
}
```
[Terrform Modules Sources Reference](https://developer.hashicorp.com/terraform/language/modules/sources)

## AWS S3 Static Website Hosting

### Enable Static Website Hosting for S3 Bucket
- Enable Static Website Hosting for s3 Bucket using [Terraform Regsitry Doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration).
- Upload index.html and error.html in S3 Bucket using [Terraform Regristry Doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object).

### Working with Files in Terraform 
In terraform there is a special variable called `path` that allows us to reference local paths:
- path.module: get the path for the current module
- path.root: get the path of the root module
- [Special Path Variable](https://developer.hashicorp.com/terraform/language/expressions/references)

## CloudFront Distribution Implementation

### CloudFront Disribution for S3 Bucket 
- Provisioned a CloudFront Distribution which uses the S3 Bucket as origin, the purpose of this implementation is for ONLY CloudFront to access the S3 Bucket, and not expose the bucket to public access.
- [Terraform Regristy CloudFront Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution).

### Origin Access Control
- Origin Access Control Policy manages a Cloudfront Distribution which has an S3 Bucket as origin.
- [Terraform Registry CloudFront Origin Access Control](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_control).

### AWS S3 Bucket Policy
- Attach a policy to an S3 bucket to allow CloudFront to access objects in the bucket.
- [Terraform Registry S3 Bucket Policy Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy). 

## Content Version and Terraform Data 

### Terraform Resource LifeCycle
- Lifecycle management was used to ignore changes to to S3 objects(index.html and error.html) resource attributes. 
- [Terraform Resource Lifecycle Documentation](https://developer.hashicorp.com/terraform/tutorials/state/resource-lifecycle).

### Terraform Data Resource
- The terraform_data resource is useful for storing values which need to follow a manage resource lifecycle, for this project--the terraform_data resource triggers the S3 objects(index.html and error.html) to be updated only when the `var.content_version` is incremented, but this does invalidate the cache which i will cover in another step in this journal.
- [Terraform Data Resource Documentation](https://developer.hashicorp.com/terraform/language/resources/terraform-data).