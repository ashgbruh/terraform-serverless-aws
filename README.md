# dce-terraform-template
Template Repo for Terraform projects for the DCE team


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

- Contributing Guidelines
- Automated Releasing based on a standardized commit message syntax
- `.editorconfig` for IDEs

## Things to configure
- Dangerfile
  - Whether you want to enforce a certain branching strategy
  - Other options available

- Contact details
- Location of your Terraform for GHA

## How to use
1. Click on the green button in the top left called "Use Template"
2. Modify key files according to the section above
3. Set branch  protections/user access/etc
