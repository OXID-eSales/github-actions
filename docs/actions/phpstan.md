# phpstan
Runs phpstan reports and creates an artifact for this

## Inputs:
**title:** *not required*, *default:* shop_ce  
Title used in the file names for the phpmd reports. Set to module ids for a module.

**source_path:** *not required*, *default:* source  
A folder to run the phpmd in.

**report_path:** *not required*, *default:* reports  
Name of the folder to store the generated reports and PHP error log in.

**neon_file:** *not required*, *default:* tests/PhpStan/phpstan.neon  
Name of the .neon file for phpstan.

**verbose:** *not required*, *default:* false  
If set to true, not only phpmd-report but an additional phpmd run with text output
will be executed. This output is visible in the github logs and will be saved in the archive.

**container_name:** *not required*, *default:*  php  
Name of the container to run the test in.

**container_options:** *not required*, *default:*  ''  
Options to pass to the container start.

**container_method:** *not required*, *default*: 'exec'  
Whether we use exec to run the command in the existing php container or run to spin up a new one.

**output_artifact:** *not required*, *default:*  phpmd  
Github run artifact to put the output files in.

**debug:** *not required*, *default:* ''  
Code snippet to generate the debugging code

## Outputs:
none
