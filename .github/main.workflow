workflow "Packer" {
  resolves = "packer-validate"
  on = "pull_request"
}

action "filter-to-pr-open-synced" {
  uses = "actions/bin/filter@master"
  args = "action 'opened|synchronize'"
}

action "packer-validate" {
  uses = "dawitnida/packer-github-actions/validate@v0.1.2"
  needs = "filter-to-pr-open-synced"
  secrets = ["GITHUB_TOKEN"]
}
