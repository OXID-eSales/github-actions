# composer_require
This action runs composer config.allow-plugins for a list of modules in the
format module:value in a given container (default 'php') and optionally runs
composer update at the end.

## Inputs:
**repositories:** *required*, *no default*  
Space separated list of repository:value pairs to configure.

**update:** *not required*, *default*: false  
Run composer update after configuring all repositories.

**update_options:** *not required*, *default*: '--no-interaction'  
Options to pass along to composer when running composer update.

**container_name:** *not required*, *default*: 'php'  
Name of the container to run composer in, defaults to 'php'.

**container_options:** *not required*, *default*: ''  
Additional parameters to pass to docker-compose when running the container.

**container_method:** *not required*, *default*: 'exec'  
Whether we use exec to run the command in the existing php container or run to spin up a new one.
