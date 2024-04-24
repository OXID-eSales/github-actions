# run_composer_script
Runs a script defined in a composer.json.

## Inputs:
**script:** *required*, *no default:*  
Name of the script to run.

**path:** *required*, *no default:*  
Workdir for the script.

**run_composer_install:** *not required*, *default:*  true  
Run composer install in the workdir.

**install_options:** *not required*, *default:*  ''  
Options to pass along to composer when running composer install.

**container_name:** *not required*, *default:*  php  
Name of the container to run the test in.

**container_options:** *not required*, *default:*  ''  
Options to pass to the container start.

**container_method:** *not required*, *default*: 'exec'  
Whether we use exec to run the command in the existing php container or run to spin up a new one.

**output_files:** *not required*, *default:* source/tests/output/*  
Output files of the code analysis to put into the output artifact.

**output_artifact:** *not required*, *default:*  run_composer_script  
Github run artifact for the output.

**debug:** *not required*, *default:* false  
Set to true to generate a debugging script.

**github_token:** *not required*, *default:* ''  
If set, this will configure the github token before running composer.

## Outputs:
none
