# Danger

[Danger](https://github.com/danger/danger) runs during the CI process, and automates common code review chores. [GitHub Actions](../.github/workflows/danger.yml) are used for this task.

Danger uses the exposed `secrets.GITHUB_TOKEN` as its API token so set up is minimal.

## Rules

Rules are defined in the [Dangerfile](../Dangerfile) with Ruby. Others can be added as needed. For instance, there is a check against the branch name to make sure it refers to a JIRA ticket:

```ruby
def branch_name(text)
  dtext = text.to_s.downcase
  dtext.match(/^dce-\d+\/\w+/)
end

jira_branch_name = branch_name(github.branch_for_head)
if !jira_branch_name
  warn(
    'The branch name does not match the standards. '\
    'Please create a Jira ticket and create a branch like <JIRA-TICKET-ID>/<FEATURE-BUG-NAME>. ' \
    'Example: dce-007/delete-cluster'
  )
end
```
