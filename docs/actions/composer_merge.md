# composer_merge
This action takes a json code snippet and merges it with a given composer.json
using the load_testplan action.

## Inputs:
**file:** *required*, *no default*  
Path of the composer.json to modify.

**backup:** *not required*, *true*  
This allows for creation of  a backup of the composer.json, adding the suffix
.bak. Setting this to false disables the backup generation.

**transform:** *required*, *no default*:  
This multiline string must contain a valid json object which will be merged
with the above file.

**update:** *not required*, *default*: true  
Run composer update after configuring all repositories.

**update_options:** *not required*, *default*: '--no-interaction'  
Options to pass along to composer when running composer update.

**container_name:** *not required*, *default*: 'php'  
Name of the container to run composer in, defaults to 'php'.

**container_options:** *not required*, *default*: ''  
Additional parameters to pass to docker-compose when running the container.

**container_method:** *not required*, *default*: 'exec'  
Whether we use exec to run the command in the existing php container or run to spin up a new one.

**debug:** *not required*, *default:* false  
Set to true to generate a debugging script.
