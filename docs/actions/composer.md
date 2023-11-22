# composer
This action executes a composer command with a variable list of parameters. It
is intended as a generic frontend to composer

## Inputs:
**action:** *required*, *no default*  
An action like configure, remove etc to be executed by composer.

**parameters:** *required*, *no default*  
A multiline string with parameters to iterate over. composer **action** will
be executed for each line.

**options:** *not required*, *default*: ''  
This will be added at the end of each composer command.

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
