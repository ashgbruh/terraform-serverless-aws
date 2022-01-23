# Prerequisites

## Tools

- [Makefile]
- [Terragrunt]
- [Docker]
- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- [tflint](https://github.com/terraform-linters/tflint)

### Pre-Commit Terraform

- [pre-commit](https://pre-commit.com/) - Checks the code for TF syntax error and auto-generates README with inputs/outputs.
  - [tflint](https://github.com/wata727/tflint)
  - [terraform-docs](https://github.com/segmentio/terraform-docs)
    - must be version *>=0.8.1*

**Note:** Whenever a change to a Terraform module is committed, the pre-commit hook will then run locally and update the README for that module if required. If the README is updated then the pre-commit hook will fail - this is *normal* behavior and is just to prompt you to `git add` the modified README before attempting the commit again.

### Commands to run on MacOS to install all the above dependencies

```bash
make install TERRAFORM_VERSON=0.12.26
```

Run `make help` to see all the individual targets.

### Features
- Pre-Commit
  - Terraform Format
  - Terraform Docs (auto-generation based on inputs/outputs/providers)
  - Terraform Validate
  - Trailing Whitespaces, EOF fixer, JSON check, etc. See [.pre-commit-yaml]

- GitHub Actions (GHA)
  - Stale PRs
  - Danger checks (commit message length, naming conventions, etc)
  - Terraform Formatting
  - [TFLint](https://github.com/terraform-linters/tflint)
  - Checkov (AWS Security Best Practices)
  - Semantic Release
  - [PR Labeler](https://github.com/actions/labeler/blob/master/README.md)

- Templates
  - PRs
  - Issues

- Automated Labeling of PRs
  - GitHub workflow/template changes
  - Documentation updates
  - Semantic Release config
  - General repo config
