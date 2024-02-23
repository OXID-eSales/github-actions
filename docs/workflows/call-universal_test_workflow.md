# call-universal_test_workflow
This workflow builds a test environment based on the docker-eshop-sdk and
builds the oxideshop (either community or enterprise edition or a compilation).
It also allows the installation of one or more modules. It then runs phpunit,
codeception and runtest based tests with the possibility of looping over
multiple combinations of PHP, MySQL, template engines and testplans. It also
allows for generating code analysis reports via phpcs, sonarcloud, phpstan
and phpmd.

## Inputs
**testplan:** *required*, *no default:*  
A file name or URL for a test plan yaml file containing all the variables
needed for building the shop and running the tests. See
tests/github_actions/defaults/defaults.yml for a documented set of defaults.

**runs_on:** *not required*, *default:* ubuntu-latest  
Runner for this workflow

**defaults:** *not required*, *default:* 'main'  
This determines the branch/tag from which the defaults are checked out.

**plan_folder:** *not required*, *default:* 'tests/github_actions'  
Folder containing the test plans.

**default_plan_folder:** *not required*, *default:* 'tests/github_actions/defaults'  
Folder containing the test plan templates.

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
URL for the slack API to send reports to.
