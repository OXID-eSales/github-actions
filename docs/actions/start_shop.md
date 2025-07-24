# start_shop

Fetches a shop installation identified by the input "cached_shop" from cache and
starts it. By providing cache_bucket, cache_endpoint etc., a local s3 cache is
used. Otherwise, it falls back to the regular GitHub cache. If the cached shop
can't be loaded, the action fails.

After loading the installation from cache, the containers are started, using
"make up". If starting the containers failed, the docker-compose.yml and the
container logs are printed

# Inputs

**cached_shop:** *required*, *no default*  
Name of the cached object from the installation job.

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

**docker_login:** *not required*, *default:* true  
Should we log in to docker?

**docker_user:** *not required*, *default:* ''  
Needed for docker login.
Populate with \${{ secrets.DOCKER_HUB_USER }}, GitHub will hide its content.

**docker_token:** *not required*, *default:* ''  
Needed for docker login.
Populate with \${{ secrets.DOCKER_HUB_TOKEN }}, GitHub will hide its content.

**wait_for_selenium:** *not required*, *default:* false  
Set to true if you want to wait for selenium to be ready.

**container_name:** *not required*, *default:* php  
Name of the container to run the wait command in.

**debug:** *not required*, *default:* false  
Set to true to generate a debugging script.

## Outputs

None.
