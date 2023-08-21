# prepare_shop
Prepares the shop and creates a cache for it to be used by following steps like install_shop or start_shop.

## Inputs:
**git_sdk_url:** *not required*, *default:* 'https://github.com/OXID-eSales/docker-eshop-sdk.git'  
URL for the docker-eshop sdk repository to clone.

**git_sdk_ref:** *not required*, *default:* 'master'  
Branch, tag or hash of the commit to check out.

**git_shop_url:** *not required*,*default:* 'https://github.com/OXID-eSales/oxideshop_ce.git'  
URL for the oxidshop_ce repository.

**git_shop_ref:** *required*, *no default*  
Branch, tag or hash of the commit to check out.

**git_enterprise_ref:** *not required*, *no default*  
Branch to check out for the enterprise repository.

**github_event_name:** *not required*, *default:* ''  
Name of the github event (usually github.event_name), used to handle pull requests.

**github_event_number:** *not required*, *default:* ''  
Number of the github event (usually github.event_number), used to handle pull requests.

**github_base_ref:** *not required*, *default:* ''  
Base reference (usually github.base_ref) for testing the github pull request.

**github_sha:** *required*, *no default:*  
github.sha is used in generating the cache id. This must be provided here.

**github_run_number:** *not required*, *default:*  0  
github.run_number and github.run_attempts are used in generating the cache id. They should be provided if available.

**github_run_attempt:** *not required*, *default:*  0  
github.run_number and github.run_attempts are used in generating the cache id. They should be provided if available.

**php:** *not required*, *default:*  '8.2'  
Version of PHP for this instance.

**mysql:** *not required*, *default:*  '8.0'  
Version of MySQL for this instance.

**is_enterprise:** *not required*, *default:*  false  
This action can be used on the community edition (ce) and enterprise edition (ee) of the shop. On top of setting this to true, a few extra variables/secrets must be provided for using the action on ee.

**custom_ini_error_reporting:** *not required*, *default:* E_ALL & ~E_DEPRECATED & ~E_NOTICE & ~E_WARNING    
Error reporting settings for php custom.ini.

**custom_ini_xdebug:** *not required*, *default:* xdebug.max_nesting_level=1000  
xdebug settings for php custom.ini.

**add_services:** *not required*, *default:* selenium-chrome  
Space separated list of extra services to add.

**enterprise_github_token:** *not required*, *default:* ''  
OAuth token to access enterprise repos. It is required when is_enterprise is
set to 'true'. This should be populated with ${{ secrets.enterprise_github_token }}
and will be hidden by GitHub.

**cache_bucket:** *not required*, *default:* 'oxidshop_ee'  
If set, the local s3 cache is used instead of githubs cache to speed things up on
private runners. If the bucket can't be reached, the GitHub cache is used.

**cache_endpoint:** *not required*, *default:* ''  
Needed to access the local cache instead of the GitHub cache.
Populate with ${{ secrets.CACHE_ENDPOINT }}, its content will be hidden by GitHub.

**cache_access_key:** *not required*, *default:* ''  
Needed to access the local cache instead of the GitHub cache.
Populate with ${{ secrets.CACHE_ACCESS_KEY }}, its content will be hidden by GitHub.

**cache_secret_key:** *not required*, *default:* ''  
Needed to access the local cache instead of the GitHub cache.
Populate with ${{ secrets.CACHE_SECRET_KEY }}, its content will be hidden by GitHub.

## Outputs:
**prepared_shop**  
Name of the cached shop setup to be reused by later steps.
