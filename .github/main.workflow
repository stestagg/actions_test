workflow "New workflow" {
  on = "push"
  resolves = [
    "Test",
  ]
}

action "Build Image" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  args = "build -t stestagg/actions_test ."
}

action "Test" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  needs = ["Master only"]
  args = "run -e GITHUB_TOKEN --rm stestagg/actions_test"
  secrets = ["GITHUB_TOKEN"]
}

action "Master only" {
  uses = "actions/bin/filter@b2bea0749eed6beb495a8fa194c071847af60ea1"
  needs = ["Build Image"]
  args = "branch master"
}
