# install_themes
This action installs one or more themes using the composer inside the
given container (default 'php') and runs composer update at the end.

## Inputs:
**themes:** *required*, *no default*  
Space separated list of themes to install.

**options:** *not required*, *default*: '--with-all-dependencies'  
Options to pass along to composer when installing themes.

**update:** *not required*, *default*: true  
Run composer update after instaling the themes

**update_options:** *not required*, *default*: '--no-interaction'  
Options to pass along to composer when running composer update.

**container_name:** *not required*, *default*: 'php'  
Name of the container to run composer in, defaults to 'php'.

**container_options:** *not required*, *default*: ''  
Additional parameters to pass to docker-compose when running the container.

**container_method:** *not required*, *default*: 'exec'  
Whether we use exec to run the command in the existing php container or run to spin up a new one.
