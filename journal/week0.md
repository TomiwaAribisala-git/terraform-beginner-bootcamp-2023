# Terraform Beginner Bootcamp 2023 - Week 0

- [Semantic Versioning](#semantic-versioning)
- [Install the Terraform CLI](#install-the-terraform-cli)
  * [Considerations for Linux Distributions](#considerations-for-linux-distributions)
  * [Refactoring into Bash Scripts](#refactoring-into-bash-scripts)
    + [Shebang](#shebang)
    + [Linux Permissions Contributions](#linux-permissions-contributions)
    + [Execution Considerations](#execution-considerations)
  * [Gitpod LifeCycle (Before, Init, Command)](#gitpod-lifecycle--before--init--command-)
- [Working Env Vars](#working-env-vars)
  * [Setting and Unsetting Env Vars](#setting-and-unsetting-env-vars)
  * [Printing Vars](#printing-vars)
  * [Scoping Env Vars](#scoping-env-vars)
  * [Persisting Env Vars in Gitpod](#persisting-env-vars-in-gitpod)
- [AWS CLI Installation](#aws-cli-installation)
  * [AWS Env Vars](#aws-env-vars)
  * [Linux Permissions Contributions](#linux-permissions-contributions-1)
  * [Execution Considerations](#execution-considerations-1)
- [Terraform Basics](#terraform-basics)
  * [Terraform Registry](#terraform-registry)
  * [Terraform Console](#terraform-console)
    + [Terraform Init](#terraform-init)
    + [Terraform Plan](#terraform-plan)
    + [Terraform Apply](#terraform-apply)
    + [Terraform Destroy](#terraform-destroy)
  * [Terraform Lock Files](#terraform-lock-files)
  * [Terraform State Files](#terraform-state-files)
  * [Terraform Directory](#terraform-directory)
- [Terraform Cloud](#terraform-cloud)
  * [Setup Terraform Cloud Login and Workspace for your Terraform Configuration](#setup-terraform-cloud-login-and-workspace-for-your-terraform-configuration)


## Semantic Versioning
This project utilizes [semantic versioning](https://semver.org/).

Given a version number **MAJOR.MINOR.PATCH**, increment the:
- **MAJOR** version when you make incompatible API changes.
- **MINOR** version when you add functionality in a backward compatible manner.
- **PATCH** version when you make backward compatible bug fixes.

Additional labels for pre-release and build metadata are available as extensions to the **MAJOR.MINOR.PATCH** format.

## Install the Terraform CLI 
The Terraform CLI installation has changed due to gpg keyring changes. So we needed to refer to the latest Terraform CLI instructions via Terraform documentation and change the scripting for install.

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Considerations for Linux Distributions
This project is built against Ubuntu; Please consider checking your Linux Distribution and change accordingly to distribution needs.

[How to Check OS Version in Linux](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

Example of checking OS Version:
```
$ cat /etc/os-release
NAME="Ubuntu"
VERSION="20.04.1 LTS (Focal Fossa)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 20.04.1 LTS"
VERSION_ID="20.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=focal
UBUNTU_CODENAME=focal
```

### Refactoring into Bash Scripts
While fixing the Terraform CLI gpg deprecation issues we notice that bash scripts were a considerable amount of code, so we decided to create a bash script to install the Terraform CLI. 

The bash script is located here: [./bin/install-terraform-cli](./bin/install-terraform-cli)
- This will keep the Gitpod Task File [.gitpod.yml](.gitpod.yml) tidy.
- This allows us to better debug and execute Terraform CLI manually.
- This will allow better portability for other projects that need to install the Terraform CLI.

#### Shebang
- A Shebang (pronounced sha-bang) tells the bash script which program will interpret the script.

- Recommended for bash: `#!/usr/bin/env bash`

- [Shebang Wikipedia Reference](https://en.wikipedia.org/wiki/Shebang_(Unix))

#### Linux Permissions Contributions

In order to make our bash scripts executable we need to change the linux permission for the file to be executable at user mode;

```
chmod u+x ./bin/install-terraform-cli
```

alternatively,
```
chmod 744 ./bin/install-terraform-cli
```

#### Execution Considerations

When executing the bash script we can use the `./` shorthand notation to execute the bash script;

eg. `./bin/install-terraform-cli`

If we are using a script in .gitpod.yml, we need to point the script to a program to interpret it 

eg. `source ./bin/install-terraform-cli`


### Gitpod LifeCycle (Before, Init, Command)

- Take note need when using the Init command because it will not rerun if we restart an exisiting workspace.

- [Gitpod LifeCycle Reference](https://www.gitpod.io/docs/configure/workspaces/tasks)

## Working Env Vars

- We can list out all Environment variables(Env Vars) using the `env` command

- We can filter specific env vars using grep eg. `env | grep AWS`

### Setting and Unsetting Env Vars 

- In the terminal we can set using `export HELLO='world`

- In the terminal we can unset using `unset HELLO`

- We can set an env var temporarily when just running a command 
```
HELLO='world' ./bin/print_message
```

- Within a bash script we can set env without writing export eg
```
HELLO='world'

echo $HELLO
```

### Printing Vars

- We can print an env var using echo eg. `echo $HELLO`

### Scoping Env Vars

- When you open up new bash terminals in VSCode it will not be aware of the env vars that you have set in another window.

- If you want Env Vars to persist across all future bash terminals that are open, you need to set env vars in your bash profile. eg. `.bash_profile`

### Persisting Env Vars in Gitpod

- We can persist env vars into gitpod by storing them in Gitpod Secrets Storage.

```
gp env HELLO='world'
```

- All future workspaces launched will set the env vars for all bash terminals opened in those workspaces.

- You can also set env vars in the `.gitpod.yml` file but this can only contain non-sensitive env vars.


## AWS CLI Installation

AWS CLI is installed for this project via the bash script [./bin/install-aws-cli](./bin/install-aws-cli)

[AWS CLI Install Reference](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

[AWS Environment Variables Reference](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials is configured correctly by running the following commands: 
```
aws sts get-caller-identity
```

### AWS Env Vars
- Create an AWS account.
- Create an IAM User and create access keys for the User.
- Set AWS enviroment variables for bash; insert your access keys and desired region between the quotes:
```
export AWS_ACCESS_KEY_ID=''
export AWS_SECRET_ACCESS_KEY=''
export AWS_DEFAULT_REGION=''
```
- Set AWS environment variables for Gitpod; insert your access keys and desired region between the quotes:
```
gp env AWS_ACCESS_KEY_ID=''
gp env AWS_SECRET_ACCESS_KEY=''
gp env AWS_DEFAULT_REGION=''
```

### Linux Permissions Contributions

In order to make our bash script executable we need to change the linux permission for the file to be executable at user mode;

```
chmod u+x ./bin/install-aws-cli
```

alternatively,
```
chmod 744 ./bin/install-aws-cli
```

### Execution Considerations

- When executing the bash script we can use the `./` shorthand notation to execute the bash script:

eg. `./bin/install-aws-cli`

- If we are using a script in .gitpod.yml, we need to point the script to a program to interpret it 

eg. `source ./bin/install-aws-cli`

- Check AWS Credentials using the `aws sts get-caller-identity` command; you should get a json payload details return below;
```json
{
    "UserId": "xxxxxxxxxxxxxxxxxxxxx",
    "Account": "xxxxxxxxxxxx",
    "Arn": "arn:aws:iam::xxxxxxxxxxxx:user/terraform-beginner-bootcamp"
}
```

## Terraform Basics 

### Terraform Registry

Terraform sources their providers and modules from the Terraform registry which is located at [registry.terraform.io](https://registry.terraform.io/)

- **Providers** is an interface to APIs that will allow to create resources in terraform. 
- **Modules** is an IAC structure to make terraform code modular, portable and shareable.

[Terraform Providers](https://registry.terraform.io/browse/providers)

[Terraform Modules](https://registry.terraform.io/browse/modules)

### Terraform Console

We can see a list of all Terraform commands by simply typing `terraform` via the CLI 

#### Terraform Init 

At the start of a new terraform project, we will run `terraform init` to download and initialize the binaries of the terraform providers we will use in this project. 

#### Terraform Plan

The `terraform plan` command will generate out a changeset i.e. plan, which is the state of our infrastructure and what will be changed. 

#### Terraform Apply

The `terraform apply` command will run a plan an pass the changeset to be executed, prompted by a yes/no option.

If we want to automatically approve an apply, we can provide the auto approve flag eg. `terraform apply --auto-approve`.

#### Terraform Destroy
The `terraform destroy` command will destory resources. 

You can also use the auto-approve command to skip the approve prompt; `terraform destroy --auto-approve`

### Terraform Lock Files 

`.terraform.lock.hcl` contains the locked versioning for the providers or modules that should be used with this project. 

The Terraform Lock File should be committed to your Version Control(VSC) eg. Github, Gitlab. 

### Terraform State Files

`terraform.tfstate` contain information about the current state of your infrastructure.

The State File contains sensitive data.

If you lose this file, you lose knowwing the state of your infrastracture. 

This file **should not be committed** to your Version Control System(VCS).

`terraform.tfstate.backup` is the previous state file.

### Terraform Directory

`.terraform` directory contains binaries of terraform providers.

## Terraform Cloud 
Create a free [Terraform Cloud Account](https://app.terraform.io/), create an organization and a workspace.

### Setup Terraform Cloud Login and Workspace for your Terraform Configuration 
- Execute `terraform login` command via the CLI, you will be prompted with an approval, type yes, then you wll be presented with a wiswig view, exit the view with q button and press Enter.

- You will then be prompted for a Token to set up your Terraform Cloud Login. 

- Create a token in your Terraform Cloud account user settings and paste your token, notice that the token won't be viewable, so just paste the token once and click Enter.

- Make sure to input the Terraform Cloud organization/workspace details in your terraform config file--main.tf, example below:
```
terraform {
   cloud {
    organization = "tomiwa-terraform-bootcamp-2023"
    workspaces {
      name = "tomiwa-terra-house-1"
    }
  }
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
```

- Initialize your working directory and remove any local state file

The `terraform init` command moves your infrastructure state file to Terraform Cloud.
```
terraform init
```

Remove your local state file
```
rm .terraform/terraform.tfstate
```

- Authenticate your Terraform Cloud account workspace with your AWS credentials.

Click on your workspace in your Terraform Cloud account, click on Variables, scroll to Workspace Variables, add variables across your `AWS_ACCESS_KEY`, `AWS_SECRET_KEY_ID` and `AWS_DEFAULT_REGION`as environmental variables. Make sure to mark these variables as sensitive.

- Execute Terraform Commands.

Terraform Plan:
```
terraform plan 
```

Terraform Apply: 
```
terraform apply
```
OR
```
terraform apply --auto-approve
```

Terraform Destroy:
```
terraform destory
``` 
Terraform is now storing your information state file in Terraform Cloud. Remote State storage make collaboration easier and keeps secrets and sensitive information and state files across your local machine. Terraform commands via CLI runs are reflected in the Terraform Cloud workspace. 