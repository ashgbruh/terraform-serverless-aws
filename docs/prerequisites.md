# Prerequisites

## Tools

- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- [aws-azure-login](https://sainsburys-confluence.valiantys.net/pages/viewpage.action?spaceKey=CENG&title=AWS+Access%3A+User+Guide)
- [tflint](https://github.com/terraform-linters/tflint)

### Pre-Commit Terraform

- [pre-commit](https://pre-commit.com/) - Checks the code for TF syntax error and auto-generates README with inputs/outputs.
  - [tflint](https://github.com/wata727/tflint)
  - [terraform-docs](https://github.com/segmentio/terraform-docs)
    - must be version *>=0.8.1*

**Note:** Whenever a change to a Terraform module is committed, the pre-commit hook will then run locally and update the README for that module if required. If the README is updated then the pre-commit hook will fail - this is *normal* behavior and is just to prompt you to `git add` the modified README before attempting the commit again.

### Commands to run on MacOS to install all the above dependencies

You can simply run `make install` from the root of this repository to install all of the below requirements.
The [Makefile](../Makefile) defaults to a certain version of Terraform. For specific versions:

```bash
make install TERRAFORM_VERSON=0.12.26
```

Run `make help` to see all the individual targets.
