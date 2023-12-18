# clean_cache
This action installs githubcli,s3cmd and cleans the cached github objects,s3 cache. 

## Inputs
cache_endpoint:required
Needed to access the local cache instead of the GitHub cache. Populate with ${{ secrets.CACHE_ENDPOINT }}, its content will be hidden by GitHub.

cache_access_key:required
Needed to access the local cache instead of the GitHub cache. Populate with ${{ secrets.CACHE_ACCESS_KEY }}, its content will be hidden by GitHub.

cache_secret_key:required
Needed to access the local cache instead of the GitHub cache. Populate with ${{ secrets.CACHE_SECRET_KEY }}, its content will be hidden by GitHub.

cache_objects:required
Needed to delete the objects for complete cleanup.Populate with ${{ secrets.CACHE_OBJECTS }}, its content will be hidden by GitHub.