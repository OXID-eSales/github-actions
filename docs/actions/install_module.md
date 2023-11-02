# install_module
Fetches the module and installs it.

## inputs
**cached_shop:** *required*, *no default*  
Name of the cached object from [prepare_shop](prepare_shop.md)/[install_shop](install_shop.md) or a previous install_module.

**container_name:** *not required*, *default:*  php  
Name of the container to run the test in.

**container_options:** *not required*, *default:*  ''  
Options to pass to the container start.

**container_method:** *not required*, *default*: 'exec'  
Whether we use exec to run the command in the existing php container or run to spin up a new one.

**package:name:** *required*, *no default*  
Name of the module package.

**module_ids:** *required*, *no default*  
Ids of the module.

**module_path:** *not required*, *default:* test-module  
Path for the checkout and url.

**template_engine:** *not required*, *default:* both  
One of twig, smarty, both.

**git_module_url:** *required*, *no default*  
URL for the module repository.

**git_module_ref:** *required*, *no default*  
Branch, tag or hash of the commit to check out.

**php:** *not required*, *default:*  '8.2'  
Version of PHP for this instance.

**mysql:** *not required*, *default:*  '8.0'  
Version of MySQL for this instance.

**output_files:** *not required*, *default:*
    - docker-compose.yml
    - source/composer.json
    - source/composer.lock
    - source/source/config.inc.php
Output files of the module installation.

**output_artifact:** *not required*, *default:*  Configs-${{ inputs.php }}-${{ inputs.mysql }}-${{ inputs.template_engine }}_${{ inputs.module_ids }}  
Github run artifact to put the output files in.

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

## outputs
**installed_shop_with_module:**  
Name of the cached shop installation