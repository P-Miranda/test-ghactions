# Test Github Actions
Repository to test github actions.

# Main Goal
Trigger validation runs in our machines by accessing via ssh from github runner.

# Regular Self-Hosted Github Actions Setup
- [Add self-hosted runner to an
  organization](https://docs.github.com/en/actions/hosting-your-own-runners/adding-self-hosted-runners#adding-a-self-hosted-runner-to-an-organization)

- Extra installation (but simple)
- Needs ssh access
- More integration
- Simpler workflows (don't need to manage secrets and ssh connections from
  github's runners, etc

# Security Concerns
From [Github
actions](https://docs.github.com/en/actions/hosting-your-own-runners/adding-self-hosted-runners)
documentation: 
Warning: We recommend that you only use self-hosted runners with private
repositories. This is because forks of your repository can potentially run
dangerous code on your self-hosted runner machine by creating a pull request
that executes the code in a workflow.

This is potentially problematic if we allow pull requests to run, since anyone
can create a PR, anyone can trigger an arbitrary workflow in our systems.