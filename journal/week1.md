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