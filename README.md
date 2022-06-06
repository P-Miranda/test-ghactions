# Test Github Actions
Repository to test github actions.

# Regular Self-Hosted Github Actions Setup

## Installation / Setup
- [Add self-hosted runner to an
  organization](https://docs.github.com/en/actions/hosting-your-own-runners/adding-self-hosted-runners#adding-a-self-hosted-runner-to-an-organization)
    - profile icon > your organizations > settings > actions > runners >
        > new runner
        > select OS and architecture (Linux, x64)
        > follow instructions and commands in self-hosted machine
- Configure the self-hosted runner application as a service:
    - [source](https://docs.github.com/en/actions/hosting-your-own-runners/configuring-the-self-hosted-runner-application-as-a-service)
    - Automatically starts the runner application when the machine starts
    - Steps:
        - Stop the runner applications if it is running
        - Install service: `sudo ./svc.sh install`
        - Start the service: `sudo ./svc.sh start`
        - Check the service: `sudo ./svc.sh status`
        - Stop the service: `sudo ./svc.sh stop`
        - Uninstall the service: `sudo ./svc.sh uninstall`


- Require approval to run workflows from other repositories:
  [source](https://docs.github.com/en/organizations/managing-organization-settings/disabling-or-limiting-github-actions-for-your-organization#configuring-required-approval-for-workflows-from-public-forks)
    - profile icon > your organizations > settings > actions > general > 
        > Fork pull requests workflows from outside collaborators > 
        > Require approval for all outside collaborators

## Remove Self-Hosted Runner
- [Instructions
  sources](https://docs.github.com/en/actions/hosting-your-own-runners/removing-self-hosted-runners#removing-a-runner-from-an-organization)
    - go to organization page > settings > actions > runners >
        > choose runner that you want to remove
        > Remove
        > Follow recommended instructions to remove self-hosted runner

## Benefits
- Extra installation (but simple)
- Better integration with github tools
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

## Proposed Solution
- Standard option is to require approval to run workflows from other
  repositories [check this
  page](https://docs.github.com/en/actions/managing-workflow-runs/approving-workflow-runs-from-public-forks)
  for more information.

## Other random options
- Option 2: Don't trigger workflows in pull requests automatically.
- Option 3: Allow organization members to trigger workflows.
    - This way, the organization members can trigger workflows for their PR's,
    while other people's PR's need manual review before triggering workflows.
    - Other Problem: manual triggered workflows do not update commit status
- Option 4: Check for changes in `.github/workflows`
    - this is not as robust, since they can change any other script already run
      by the current workflow. For example changing what `make test` does
