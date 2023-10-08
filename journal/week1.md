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

