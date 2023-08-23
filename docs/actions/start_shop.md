# start_shop
Fetches a shop installation identified by the input "cached_shop" from cache and starts it.
By providing cache_bucket, cache_endpoint etc, a local s3 cache is used. Otherwise, it falls
back to the regular Github cache. If the cached shop can't be loaded, the action fails.

After loading the installation from cache, trhe containers are started, using "make up".
If starting the containers failed, the docker-compose.yml and the container logs are printed

# Inputs:
**cached_shop:** *required*, *no default*  
Name of the cached object from [prepare_shop](prepare_shop.md)/[install_shop](install_shop.md).

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
