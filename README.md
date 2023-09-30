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
A Shebang (pronounced sha-bang) tells the bash script which program will interpret the script.

Recommended for bash: '#!/usr/bin/env bash'

[Shebang Wikipedia Reference](https://en.wikipedia.org/wiki/Shebang_(Unix)

### Execution Considerations

When executing the bash script we can use the './' shorthand notation to execute the bash script;

eg. './bin/install-terraform-cli'

If we are using a script in .gitpod.yml, we need to point the script to a program to interpret it 

eg. 'source ./bin/install-terraform-cli'

### Linux Permissions Contributions

In order to make our bash scripts executable we need to change the linux permission for the file to be executable at user mode;

```
chmod u+x ./bin/install-terraform-cli
```

alternatively,
```
chmod 744 ./bin/install-terraform-cli
```

### Gitpod LifeCycle (Before, Init, Command)

We need to be careful when using the Init command because it will not rerun if we restart an exisiting workspace

[Gitpod LifeCycle Reference](https://www.gitpod.io/docs/configure/workspaces/tasks)