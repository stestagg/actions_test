workflow "New workflow" {
  on = "push"
  resolves = ["GitHub Action for Docker-1"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  args = "build -t stestagg/actions_test ."
}

action "GitHub Action for Docker-1" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  needs = ["GitHub Action for Docker"]
  args = "run -e GITHUB_TOKEN --rm stestagg/actions_test"
  secrets = ["GITHUB_TOKEN"]
}
