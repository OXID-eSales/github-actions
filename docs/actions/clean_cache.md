# clean_cache

This action installs githubcli, s3cmd and cleans the cached GitHub objects, s3
cache. 

## Inputs

**cache_bucket:** *not required*, *default:* 'oxidshop_ee'  
If set, the local s3 cache is used instead of GitHub cache to speed things up on
private runners. If the bucket can't be reached, the GitHub cache is used.

**cache_endpoint:** *not required*, *default:* ''  
Needed to access the local cache instead of the GitHub cache.
Populate with \${{ secrets.CACHE_ENDPOINT }}, GitHub will hide its content.

**cache_access_key:** *not required*, *default:* ''  
Needed to access the local cache instead of the GitHub cache.
Populate with \${{ secrets.CACHE_ACCESS_KEY }}, GitHub will hide its content.

**cache_secret_key:** *not required*, *default:* ''  
Needed to access the local cache instead of the GitHub cache.
Populate with \${{ secrets.CACHE_SECRET_KEY }}, GitHub will hide its content.

**cache_objects:** *required*,
List of objects to delete.

**debug:** *not required*, *default:* false  
Set to true to generate a debugging script.

## Outputs

None.
