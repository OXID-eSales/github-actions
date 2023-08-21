# call-test_matrix
This workflow runs a full set of tests for both oxidshop_ce and oxidshop_ee. It is intended to be called by a
workflow in the respective repository (shop or module), thus relying heavily on their input.

Each matrix runs the following jobs:
- output parameters
- prepare shop and cache it as preparedShop_<edition>-<ref>-<php_version>-<mysql_version>-<commit_sha>-<run>-<attempt>
- install shop based on the prepared shop and cache it as shopInstallation_<edition>-<ref>-<php_version>-<mysql_version>-<commit_sha>-<run>-<attempt>
- run unit tests using the cached shopInstallation
- run integration tests  using the cached shopInstallation
- run codeception tests  using the cached shopInstallation
- run shop setup tests using the cached preparedShop

## Inputs
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
