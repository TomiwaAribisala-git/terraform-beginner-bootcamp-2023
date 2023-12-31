# Terraform Beginner Bootcamp 2023 - Week 2

## Terraform Mock Server

### Running The Web Server
- Upon initialization of our Gitpod environment, we enabled the Sinatra Web Server to start in the `gitpod.yml` file, [Gitpod Documentation](https://www.gitpod.io/docs/introduction/getting-started), Close workspace, Restart workspace.
- We run the web serveer by manually by executing the command `bundle exec ruby server.rb`. 
- All of the code for our server is stored in the `server.rb` file. 

## Working With Ruby

### Bundler
Bundler is a package manager for Ruby, it is the primary way to install Ruby packages(known as gems) for Ruby. 

### Install Gems
- You need to create a Gemfile and define your gems in that file.
```
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```
- Then you run the `bundle install` command--(more like `npm install`), this will install the gems on the system globally(unlike nodejs which install packages in a node_modules directory).

### Executing Ruby Scripts In the Context of Bundler
- Use `bundle exec` to install future Ruby scripts, the command uses the gems we already installed.

### Sinatra
- Sinatra is a micro web-framework for Ruby to build web-apps. 
- Its great for mock or development servers/simple projects.
- You can create a web-server in a single file.
- [Sinatra Reference](https://sinatrarb.com/).


## Terraform Terratowns Provider and Resource Skeleton

### Set Terratowns Token Env Var and Exampro UUID Env Var
- Replace the token with your actual token.
```
export TF_VAR_terratowns_access_token="token"
```
```
gp env export TF_VAR_terratowns_access_token="token"
```
- Replace the UUID with your Exampro Account UUID.
```
export TF_VAR_teacherseat_uuid="UUID"
```
```
gp env export TF_VAR_teacherseat_uuid="UUID"
```
- Set Custom Terraform Provider Endpoint
```
var.terratowns_endpoint
```
- Execute Custom Terraform Provider Script
```
./bin/build_provider
```
- Execute Terraform Commands
```
terraform init
```
```
terraform plan
```
```
terraform apply --auto-approve
```