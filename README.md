# Overview
This repository contains re-usable workflows and actions for the OXID-eSales repositories.

## Workflows
- call-test_matrix: Full test matrix for oxidshop_ce and oxidshop_ee.

## Actions
- Auxiliary actions
    - cleanup_workspace: Empties the current folder, stops all docker containers and prunes docker.
    - install_themes: Installs one or more themes using the composer inside the PHP container
- Setup actions
    - prepare_shop: Prepares the shop and creates a cache for it.
    - start_shop: Fetches a shop from cache and starts it
    - install_shop: Installs a shop with a given pvp/MySQL combination and caches the installed shop.
- Test actions
    - phpunit: Executes phpunit tests in a running container
    - codeception: Executes codeception tests in a running container and uploads the logs and outputs as artifacts.

# Workflows

Reusable github workflow code used in the OXID eShop github workflows.

## call-test_matrix
Full test matrix for oxidshop_ce and oxidshop_ee. 
This matrix runs the following jobs:
- output parameters
- prepare shop and cache it as preparedShop_<edition>-<ref>-<php_version>-<mysql_version>-<commit_sha>-<run>-<attempt>
- install shop based on the prepared shop and cache it as shopInstallation_<edition>-<ref>-<php_version>-<mysql_version>-<commit_sha>-<run>-<attempt>
- run unit tests using the cached shopInstallation
- run integration tests  using the cached shopInstallation
- run codeception tests  using the cached shopInstallation
- run shop setup tests using the cached preparedShop

### Inputs
**runs_on:** *not required*, *default:* ubuntu-latest  
Runner for this workflow

**git_sdk_url:** *not required*, *default:* 'https://github.com/OXID-eSales/docker-eshop-sdk.git'  
URL for the docker-eshop sdk repo to clone

**git_sdk_ref:** *not required*, *default:* 'master'  
Branch, tag or hash of the commit to check out

**git_shop_url:** *not required*,*default:* 'https://github.com/OXID-eSales/oxideshop_ce.git'  
URL for the oxidshop_ce repository

**git_shop_ref:** *required*, *no default*  
Branch, tag or hash of the commit to check out

**git_enterprise_ref:** *not required*, *no default*  
Branch to check out for the enterprise repos

**github_event_name:** *not required*, *default:* ${{ github.event_name }}  
Name of the github event (github.event_name), used to handle pull requests

**github_event_number:** *not required*, *default:* ${{ github.event_number }}  
Number of the github event (github.event_number), used to handle pull requests

**github_base_ref:** *not required*, *default:* ${{ github.base_ref }}  
Base reference for testing the github pull request

**github_sha:** *not required*, *default:*  ${{ github.sha }}  
github.sha is used in generating the cache id

**github_run_number:** *not required*, *default:*  ${{ github.run_number }}  
github.run_number and github.run_attempts are used in generating the cache id (tbd)

**github_run_attempt:** *not required*, *default:*  ${{ github.run_attempt }}  
github.run_number and github.run_attempts are used in generating the cache id (tbd)'

**php:** *not required*, *default:*  ${{ matrix.php }}  
Version of PHP for this instance

**mysql:** *not required*, *default:*  ${{ matrix.mysql }}  
Version of MySQL for this instance

**is_enterprise:** *not required*, *default:*  false  
This action can be used on the community edition (ce) and enterprise edition (ee) of the shop. On top of setting this to true, a few extra variables/secrets must
be provided for using the action on ee.

**enterprise_github_token:** *not required*, *default:* ''  
OAuth token to access enterprise repos

### Secrets

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

# Actions
Reusable github actions code used in the OXID eShop github workflows.

## Auxiliary actions
The following actions are repeated auxiliary steps for preparation or cleanup

### cleanup_workspace
The cleanup_workspace action empties the current folder, stops all docker containers and prunes docker.

#### Inputs:
none

#### Outputs:
none

### install_themes
Installs one or more themes using the composer inside the PHP container

#### Inputs:
**themes:** *required*, *no default*  
Space separated list of themes to install

**options:** *not required*, *default*: '--with-all-dependencies'  
Options to pass along to composer

#### Outputs:
none

## Setup actions

### prepare_shop
Prepares the shop and creates a cache for it.

#### Inputs:
**git_sdk_url:** *not required*, *default:* 'https://github.com/OXID-eSales/docker-eshop-sdk.git'  
URL for the docker-eshop sdk repo to clone

**git_sdk_ref:** *not required*, *default:* 'master'  
Branch, tag or hash of the commit to check out

**git_shop_url:** *not required*,*default:* 'https://github.com/OXID-eSales/oxideshop_ce.git'  
URL for the oxidshop_ce repository

**git_shop_ref:** *required*, *no default*  
Branch, tag or hash of the commit to check out

**git_enterprise_ref:** *not required*, *no default*  
Branch to check out for the enterprise repos

**github_event_name:** *not required*, *default:* ${{ github.event_name }}  
Name of the github event (github.event_name), used to handle pull requests

**github_event_number:** *not required*, *default:* ${{ github.event_number }}  
Number of the github event (github.event_number), used to handle pull requests

**github_base_ref:** *not required*, *default:* ${{ github.base_ref }}  
Base reference for testing the github pull request

**github_sha:** *not required*, *default:*  ${{ github.sha }}  
github.sha is used in generating the cache id

**github_run_number:** *not required*, *default:*  ${{ github.run_number }}  
github.run_number and github.run_attempts are used in generating the cache id (tbd)

**github_run_attempt:** *not required*, *default:*  ${{ github.run_attempt }}  
github.run_number and github.run_attempts are used in generating the cache id (tbd)'

**php:** *not required*, *default:*  ${{ matrix.php }}  
Version of PHP for this instance

**mysql:** *not required*, *default:*  ${{ matrix.mysql }}  
Version of MySQL for this instance

**is_enterprise:** *not required*, *default:*  false  
This action can be used on the community edition (ce) and enterprise edition (ee) of the shop. On top of setting this to true, a few extra variables/secrets must
be provided for using the action on ee.

**enterprise_github_token:** *not required*, *default:* ''  
OAuth token to access enterprise repos

**cache_endpoint:** *not required*, *default:* ${{ secrets.CACHE_ENDPOINT }}  
secrets.CACHE_ENDPOINT for actions-cache

**cache_access_key:** *not required*, *default:* ${{ secrets.CACHE_ACCESS_KEY }}  
secrets.CACHE_ACCESS_KEY for actions-cache

**cache_secret_key:** *not required*, *default:* ${{ secrets.CACHE_SECRET_KEY }}  
secrets.CACHE_SECRET_KEY  for actions-cache

#### Outputs:
**prepared_shop**  
Name of the cached shop setup

### start_shop
Fetches a shop from cache and starts it

#### Inputs:
**cached_shop:** *required*, *no default*  
Name of the cached object from prepare_shop/install_shop

**cache_endpoint:** *not required*, *default:* ${{ secrets.CACHE_ENDPOINT }}  
secrets.CACHE_ENDPOINT for actions-cache

**cache_access_key:** *not required*, *default:* ${{ secrets.CACHE_ACCESS_KEY }}  
secrets.CACHE_ACCESS_KEY for actions-cache

**cache_secret_key:** *not required*, *default:* ${{ secrets.CACHE_SECRET_KEY }}  
secrets.CACHE_SECRET_KEY  for actions-cache

### install_shop
Installs a shop with a given pvp/MySQL combination and caches the installed shop.

#### Inputs:

**git_enterprise_ref:** *not required*, *no default*  
Branch to check out for the enterprise repos

**git_shop_ref:** *not required*, *no default*  
Branch to check out for the enterprise repos

**github_sha:** *required*, *default:*  ${{ github.sha }}  
github.sha is used in generating the cache id

**github_run_number:** *not required*, *default:*  ${{ github.run_number }}  
github.run_number and github.run_attempts are used in generating the cache id (tbd)

**github_run_attempt:** *not required*, *default:*  ${{ github.run_attempt }}  
github.run_number and github.run_attempts are used in generating the cache id (tbd)'

**php:** * required*, *default:*  ${{ matrix.php }}  
Version of PHP for this instance

**mysql:** *required*, *default:*  ${{ matrix.mysql }}  
Version of MySQL for this instance

**is_enterprise:** *not required*, *default:*  false  
This action can be used on the community edition (ce) and enterprise edition (ee) of the shop. On top of setting this to true, a few extra variables/secrets must
be provided for using the action on ee.

**cache_endpoint:** *not required*, *default:* ${{ secrets.CACHE_ENDPOINT }}  
secrets.CACHE_ENDPOINT for actions-cache

**cache_access_key:** *not required*, *default:* ${{ secrets.CACHE_ACCESS_KEY }}  
secrets.CACHE_ACCESS_KEY for actions-cache

**cache_secret_key:** *not required*, *default:* ${{ secrets.CACHE_SECRET_KEY }}  
secrets.CACHE_SECRET_KEY  for actions-cache

#### Outputs:
**installed_shop**  
Name of the cached shop setup

## Test actions
These actions execute various tests on the previously installed shops

### phpunit
Executes phpunit tests in a running container and uploads the logs as artefacts.

#### Inputs:
**container:** *not required*, *default:*  php  
Name of the container to run the test in

**configuration:** *not required*, *default:*  phpunit.xml  
Name of the configuration file

**test:** *not required*, *default:*  tests/Unit  
Name of the test or folder to run

**additional_options:** *not required*, *default:*  ''  
Optional: Additional options to pass to phpunit. Example: "--bootstrap bootstrap.xml"

**logfile:** *not required*, *default:*  phpunit_log.txt  
Name of the output logfile

**logfile_artifact:** *not required*, *default:*  phpunit_logs  
Github run artifact to put the logfile in

**failure_pattern:** *not required*, *default:*  'fail|\\.\\=\\=|Warning|Notice|Deprecated|Fatal|Error'  
Grep pattern which indicate that the test failed

#### Outputs:
none

### codeception
Executes codeception tests in a running container and uploads the logs and outputs as artifacts.

#### Inputs:
**container:** *not required*, *default:*  php  
Name of the container to run the test in

**container_options:** *not required*, *default:*  -e SELENIUM_SERVER_HOST=selenium -e BROWSER_NAME=chrome -e THEME_ID=apex  
Additional options to pass into the container

**configuration:** *not required*, *default:*  tests/codeception.yml  
Name of the configuration file

**build:** *not required*, *default:*  false  
Run codecept build before running the tests

**suite:** *not required*, *default:*  acceptance,acceptanceAdmin  
Name of the codeceptioun test suite to run

**test:** *not required*, *default:*  ''  
Name of a specific test to run

**additional_options:** *not required*, *default:*  ''  
Optional: Additional options to pass to codeception. Example: "--skip-group flow_theme"

**logfile:** *not required*, *default:*  phpunit_log.txt  
Name of the output logfile

**logfile_artifact:** *not required*, *default:*  phpunit_logs  
Github run artifact to put the logfile in

**output_folder:** *not required*, *default:*  source/tests/Codeception/_output  
Folder where codeception creates its output

**output_artifact:** *not required*, *default:*  codeception-artifacts    
Github run artifact to put the logfile in

**failure_pattern:** *not required*, *default:*  'fail|\\.\\=\\=|Warning|Notice|Deprecated|Fatal|Error|DID NOT FINISH'  
Grep pattern which indicate that the test failed

#### Outputs:
none
