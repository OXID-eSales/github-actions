# composer_require
This action requires one or more repositories in the
given container (default 'php') and runs composer update at the end.

## Inputs:
**organisation:** *not required*, 'oxid-esales'  
Space separated list of repositories to configure.

**repositories:** *required*, *no default*  
Space separated list of repositories to configure.

**ref:** *not required*, *no default*  
Branch to check out for the enterprise repositories.

**options:** *not required*, *default*: '--no-update'  
Options to pass along to composer when requiring the repositories.

**update:** *not required*, *default*: true  
Run composer update after configuring all repositories.

**update_options:** *not required*, *default*: '--no-interaction'  
Options to pass along to composer when running composer update.

**dumpautoload:** *not required*, *default*: false  
Run composer dumpautoload after configuring all repositories.

**dumpautoload_options:** *not required*, *default*: '--dev'  
Options to pass along to composer when running composer dumpautoload.

**container_name:** *not required*, *default*: 'php'  
Name of the container to run composer in, defaults to 'php'.

**container_options:** *not required*, *default*: ''  
Additional parameters to pass to docker-compose when running the container.

**container_method:** *not required*, *default*: 'exec'  
Whether we use exec to run the command in the existing php container or run to spin up a new one.

**enterprise_github_token:** *not required*, *default:* ''  
OAuth token to access enterprise repos. It is required when is_enterprise is
set to 'true'. This should be populated with ${{ secrets.enterprise_github_token }}
and will be hidden by GitHub.