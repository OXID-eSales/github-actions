# run_custom_scripts

Runs custom scripts defined in the test plans. The contents of custom_script is
executed in the workdir and the contents of custom_script_container is executed
in the specified container

## Inputs

**container_name:** *not required*, *default:*  php  
Name of the container to run the test in.

**container_options:** *not required*, *default:*  ''  
Options to pass to the container start.

**container_method:** *not required*, *default*: 'exec'  
Whether we use exec to run the command in the existing php container or run to spin up a new one.

**custom_script:** *not required*, *default*: ''  
Script to run in the work directory.

**custom_script_container:** *not required*, *default:*  ''  
Name of the test or folder to run.

**debug:** *not required*, *default:* false  
Set to true to generate a debugging script.

## Outputs

None.
