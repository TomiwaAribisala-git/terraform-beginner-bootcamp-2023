# Terraform Beginner Bootcamp 2023

## Semantic Versioning
This project utilizes [semantic versioning](https://semver.org/)

Given a version number **MAJOR.MINOR.PATCH**, increment the:
- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

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

### Shebang
- A Shebang (pronounced sha-bang) tells the bash script which program will interpret the script.

- Recommended for bash: '#!/usr/bin/env bash'

- [Shebang Wikipedia Reference](https://en.wikipedia.org/wiki/Shebang_(Unix))

### Linux Permissions Contributions

In order to make our bash scripts executable we need to change the linux permission for the file to be executable at user mode;

```
chmod u+x ./bin/install-terraform-cli
```

alternatively,
```
chmod 744 ./bin/install-terraform-cli
```

### Execution Considerations

When executing the bash script we can use the './' shorthand notation to execute the bash script;

eg. './bin/install-terraform-cli'

If we are using a script in .gitpod.yml, we need to point the script to a program to interpret it 

eg. 'source ./bin/install-terraform-cli'


### Gitpod LifeCycle (Before, Init, Command)

- We need to be careful when using the Init command because it will not rerun if we restart an exisiting workspace

- [Gitpod LifeCycle Reference](https://www.gitpod.io/docs/configure/workspaces/tasks)

## Working Env Vars

- We can list out all Environment variables(Env Vars) using the 'env' command

- We can filter specific env vars using grep eg. 'env | grep AWS'

### Setting and Unsetting Env Vars 

- In the terminal we can set using 'export HELLO='world''

- In the terminal we can unset using 'unset HELLO' 

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

- We can print an env var using echo eg. 'echo $HELLO'

### Scoping of Env Vars

- When you open up new bash terminals in VSCode it will not be aware of the env vars that you have set in another window.

- If you want Env Vars to persist across all future bash terminals that are open, you need to set env vars in your bash profile. eg. '.bash_profile'

### Persisting Env Vars in Gitpod

- We can persist env vars into gitpod by storing them in Gitpod Secrets Storage.

```
gp env HELLO='world'
```

- All future workspaces launched will set the env vars for all bash terminals opened in those workspaces.

- You can also set env vars in the '.gitpod.yml' file but this can only contain non-sensitive env vars.


## AWS CLI Installation

AWS CLI is installed for this project via the bash script [./bin/install-aws-cli](./bin/install-aws-cli)

[AWS CLI Install Reference](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

[AWS Environment Variables Reference](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials is configured correctly by running the following commands: 
```
aws sts get-caller-identity
```

### AWS Env Vars
- Create an AWS account
- Create an IAM User and create access keys for the User
- Set AWS enviroment variables for bash; insert your access keys and desired region between the quotes
```
export AWS_ACCESS_KEY_ID=''
export AWS_SECRET_ACCESS_KEY=''
export AWS_DEFAULT_REGION=''
```
- Set AWS environment variables for Gitpod; insert your access keys and desired region between the quotes
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

- When executing the bash script we can use the './' shorthand notation to execute the bash script;

eg. './bin/install-aws-cli'

- If we are using a script in .gitpod.yml, we need to point the script to a program to interpret it 

eg. 'source ./bin/install-aws-cli'

- Check AWS Credentials using the `aws sts get-caller-identity` command; you should get a json payload details return below;
```json
{
    "UserId": "xxxxxxxxxxxxxxxxxxxxx",
    "Account": "xxxxxxxxxxxx",
    "Arn": "arn:aws:iam::xxxxxxxxxxxx:user/terraform-beginner-bootcamp"
}
```


