# github-actions
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
Prepares the shop and creates a cache for it. This uses actions/cache@v3 for the community edition (ce)  and tespkg/actions-cache@v1 for the enterprise edition (ee).

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
**cached_name**  
Name of the cached shop setup

### start_shop
Fetches a shop from cache and starts it

#### Inputs:
**git_enterprise_ref:** *not required*, *no default*  
Branch to check out for the enterprise repos

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

**cache_endpoint:** *not required*, *default:* ${{ secrets.CACHE_ENDPOINT }}  
secrets.CACHE_ENDPOINT for actions-cache

**cache_access_key:** *not required*, *default:* ${{ secrets.CACHE_ACCESS_KEY }}  
secrets.CACHE_ACCESS_KEY for actions-cache

**cache_secret_key:** *not required*, *default:* ${{ secrets.CACHE_SECRET_KEY }}  
secrets.CACHE_SECRET_KEY  for actions-cache

### install_shop
Fetches a shop from cache and starts it

#### Inputs:

**git_enterprise_ref:** *required*, *no default*  
Branch to check out for the enterprise repos

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

**cache_endpoint:** *not required*, *default:* ${{ secrets.CACHE_ENDPOINT }}  
secrets.CACHE_ENDPOINT for actions-cache

**cache_access_key:** *not required*, *default:* ${{ secrets.CACHE_ACCESS_KEY }}  
secrets.CACHE_ACCESS_KEY for actions-cache

**cache_secret_key:** *not required*, *default:* ${{ secrets.CACHE_SECRET_KEY }}  
secrets.CACHE_SECRET_KEY  for actions-cache

#### Outputs:
none

## Test actions
These actions execute various tests on the previously installed shops

### unit_tests
Executes unit tests in a running shop

#### Inputs:
**php:** *not required*, *default:*  ${{ matrix.php }}  
Version of PHP for this instance

**mysql:** *not required*, *default:*  ${{ matrix.mysql }}  
Version of MySQL for this instance

**is_enterprise:** *not required*, *default:*  false  
This action can be used on the community edition (ce) and enterprise edition (ee) of the shop. On top of setting this to true, a few extra variables/secrets must
be provided for using the action on ee.

#### Outputs:
none

### integration_tests
Executes integration tests in a running shop

#### Inputs:
**php:** *not required*, *default:*  ${{ matrix.php }}  
Version of PHP for this instance

**mysql:** *not required*, *default:*  ${{ matrix.mysql }}  
Version of MySQL for this instance

**is_enterprise:** *not required*, *default:*  false  
This action can be used on the community edition (ce) and enterprise edition (ee) of the shop. On top of setting this to true, a few extra variables/secrets must
be provided for using the action on ee.

#### Outputs:
none

### codeception_tests

#### Inputs:
**php:** *not required*, *default:*  ${{ matrix.php }}  
Version of PHP for this instance

**mysql:** *not required*, *default:*  ${{ matrix.mysql }}  
Version of MySQL for this instance

**is_enterprise:** *not required*, *default:*  false  
This action can be used on the community edition (ce) and enterprise edition (ee) of the shop. On top of setting this to true, a few extra variables/secrets must
be provided for using the action on ee.

#### Outputs:
none

### shop_setup_tests

#### Inputs:
**php:** *not required*, *default:*  ${{ matrix.php }}  
Version of PHP for this instance

**mysql:** *not required*, *default:*  ${{ matrix.mysql }}  
Version of MySQL for this instance

**is_enterprise:** *not required*, *default:*  false  
This action can be used on the community edition (ce) and enterprise edition (ee) of the shop. On top of setting this to true, a few extra variables/secrets must
be provided for using the action on ee.

#### Outputs:
none
