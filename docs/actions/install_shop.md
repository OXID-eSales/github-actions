# install_shop
Installs a shop with a given pvp/MySQL combination and caches the installed shop.

## Inputs:

**git_enterprise_ref:** *not required*, *no default*  
Branch to check out for the enterprise repository.

**git_shop_ref:** *not required*, *no default*  
Branch to check out for the enterprise repos

**github_sha:** *required*, *default:*  ${{ github.sha }}  
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

**config_idebug** *not required*, *default:* false  
Set iDebug to -1 in config.inc.php.

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
**installed_shop**  
Name of the cached shop setup.
