# install_module

**Discontinued in v5:**

Fetches the module and installs it.

This action has been replaced by the *composer.transform* functionality using composer to install everything at once.

## Inputs

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

**activate:** *required*, *no default*  
List of module_ids to activate.

**git_module_url:** *required*, *no default*  
URL for the module repository.

**git_module_ref:** *required*, *no default*  
Branch, tag or hash of the commit to check out.

**output_files:** *not required*, *default:*
    - docker-compose.yml
    - source/composer.json
    - source/composer.lock
    - source/source/config.inc.php
Output files of the module installation.

**output_artifact:** *not required*, *default:*  install_module-artifacts  
Github run artifact to put the output files in.

**enterprise_github_token:** *not required*, *default:* ''  
OAuth token to access enterprise repos. It is required when is_enterprise is
set to 'true'. This should be populated with ${{ secrets.enterprise_github_token }}
and will be hidden by GitHub.

**debug:** *not required*, *default:* false  
Set to true to generate a debugging script.

## Outputs

**installed_shop_with_module:**  
Name of the cached shop installation