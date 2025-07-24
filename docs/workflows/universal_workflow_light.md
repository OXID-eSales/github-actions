# universal_workflow_light

This workflow replaces the `call-universal_test_workflow.md`.
It builds a test environment based on the docker-eshop-sdk and installs a php application by
 either creating a composer.json or checking out a repository containing one. The workflow
 is configured by a lot of variables provided by merging multiple test plans (YAML files).

It runs test scripts either provided in composer.json or test scripts provided by the installed
packages. These tests are executed on a matrix of different PHP and MySQL versions.

## Inputs

**testplan:** *required*, *no default*  
A file name or URL for a test plan YAML file containing all the variables
needed for building the shop and running the tests. See
tests/github_actions/defaults/defaults_light.yaml for a documented set of defaults.

**runs_on:** *required*, *no default*  
Runner for this workflow

**defaults:** *not required*, *default:* 'v5'  
This determines the branch/tag from which the defaults are checked out.

**plan_folder:** *not required*, *default:* '.github/oxid-esales'  
Folder containing the test plans.

**default_plan_folder:** *not required*, *default:* '.github/oxid-esales/defaults'  
Folder containing the test plan templates.

**debug:** *not required*, *default:* true  
Enable the generation of debugging code contained in the testplan artifact. The generated
debugging scripts can be run locally.

**custom_testplan_yaml:** *not required*, *default:* ''  
This allows for dynamic passing of YAML code containing variables. The provided multiline string
will be stored in {plan_folder}/_custom.yaml and can be used in the testplan argument as ~/_custom.yaml.

**use_scheduled_slack_channel:** *not required*, *default:* true  
If this is set to true and the secret SLACK_SCHEDULED_WEBHOOK_URL is provided, the Slack notification is sent to the channel specified by SLACK_SCHEDULED_WEBHOOK_URL instead of the channel specified by SLACK_WEBHOOK_URL.

## Secrets

**DOCKER_HUB_USER:**  
Used for logging in to docker.io

**DOCKER_HUB_TOKEN:**  
Used for logging in to docker.io

**CACHE_ENDPOINT:**  
Used for the local s3 cache when running on a private runner

**CACHE_ACCESS_KEY:**  
Used for the local s3 cache when running on a private runner

**CACHE_SECRET_KEY:**  
Used for the local s3 cache when running on a private runner

**enterprise_github_token:**  
OAuth token to access enterprise repos when building the enterprise edition

**SONAR_TOKEN:**  
Token to submit sonarcloud reports to their website

**SLACK_WEBHOOK_URL:**  
URL for the Slack API to send reports to.

**SLACK_WEBHOOK_URL:**  
URL for the Slack API to send reports to if the input use_scheduled_slack_channel is set to true.
