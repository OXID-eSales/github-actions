# prepare_shop

This action checks out the SDK. It then creates a composer.json based on a
template or contained in a given repository. In a pull request event, the base
ref is checked out and the given PR is merged into it.

The action uses the Makefile for the SDK to start the containers and composer to
install the packages.

## Inputs

**container_name:** *not required*, *default:* php  
Name of the container to run the test in.

**container_options:** *not required*, *default:* `''`
Additional options to pass into the container.

**container_method:** *not required*, *default*: 'exec'  
Whether we use exec to run the command in the existing php container or run to
spin up a new one.

**git_sdk_repository:** *not required*, *default:* 'OXID-eSales/docker-eshop-sdk'  
URL for the docker-eshop sdk repository to clone.

**git_sdk_ref:** *not required*, *default:* 'master'  
Branch, tag or hash of the commit to check out.

**compilation_url:** *not required*, *default:* `''`  
URL for downloading a basic composer.json template.

**git_repository:** *not required*,*default:* 'OXID-eSales/oxideshop_ce'  
Organisation/Repository containing the root composer.json if not using
compilation_url.

**git_ref:** *required*, *no default*  
Branch, tag or hash of the commit to check out.

**github_event_name:** *not required*, *default:* `''`  
Name of the GitHub event (usually github.event_name), used to handle pull
requests.

**github_event_number:** *not required*, *default:* `''`  
Number of the GitHub event (usually github.event_number), used to handle pull
requests.

**github_base_ref:** *not required*, *default:* `''`  
Base reference (usually github.base_ref) for testing the GitHub pull request.

**github_sha:** *required*, *no default:*  
github.sha is used in generating the cache id. This must be provided here.

**github_run_number:** *not required*, *default:* 0  
github.run_number and github.run_attempts are used in generating the cache id.
They should be provided if available.

**github_run_attempt:** *not required*, *default:* 0  
github.run_number and github.run_attempts are used in generating the cache id.
They should be provided if available.

**php:** *not required*, *default:* '8.2'  
Version of PHP for this instance.

**mysql:** *not required*, *default:* 'mysql-8.0.36'  
Version of MySQL for this instance.

**custom_ini_error_reporting:** *not required*, *default:* E_ALL & ~E_DEPRECATED
& ~E_NOTICE & ~E_WARNING    
Error reporting settings for php custom.ini.

**custom_ini_xdebug:** *not required*, *default:* xdebug.max_nesting_level=1000  
xdebug settings for php custom.ini.

**add_services:** *not required*, *default:* selenium-chrome  
Space separated list of extra services to add.

**composer_file:** *not required*, *default:* source/composer.json  
Name of the original composer.json.

**composer_transform:** *not required*, *default:* `''`  
JSON code to merge into composer.json.

**composer_backup:** *not required*, *default:* true  
Should we create a backup for composer.json?

**composer_update:** *not required*, *default:* true  
Run composer update after transform.

**composer_update_options:** *not required*, *default:* '--no-interaction'  
Options to pass along to composer during installation.

**composer_dev_ref:** *not required*, *default:* 'dev-b-8.0.x'  
Development package reference.

**enterprise_github_token:** *not required*, *default:* `''`  
OAuth token to access enterprise repos. This should be populated with
\${{ secrets.enterprise_github_token }} and will be hidden by GitHub.

**docker_login:** *not required*, *default:* true  
Should we log in to docker?

**docker_user:** *not required*, *default:* `''`  
Needed for docker login.
Populate with \${{ secrets.DOCKER_HUB_USER }}, GitHub will hide its content.

**docker_token:** *not required*, *default:* `''`  
Needed for docker login.
Populate with \${{ secrets.DOCKER_HUB_TOKEN }}, GitHub will hide its content.

**copy_script_targets:** *not required*, *default:* 'tests/scripts'  
Copy the test scripts to these target folders.

**debug:** *not required*, *default:* false  
Set to true to generate a debugging script.

## Outputs

None.
