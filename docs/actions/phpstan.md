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

**additional_options:** *not required*, *default:* ''  
Additional options to pass to phpmd.

**verbose:** *not required*, *default:* false  
If set to true, not only phpmd-report but an additional phpmd run with text output
will be executed. This output is visible in the github logs and will be saved in the archive.

**generate_baseline:** *not required*, *default:* false  
If set to true, we will generate a phpstan baseline file and save it in the actions output.
This can then be moved to the tests/PhpStan folder of the repo to replace the old baseline.

**container_name:** *not required*, *default:*  php  
Name of the container to run the test in.

**container_options:** *not required*, *default:*  ''  
Options to pass to the container start.

**container_method:** *not required*, *default*: 'exec'  
Whether we use exec to run the command in the existing php container or run to spin up a new one.

**output_artifact:** *not required*, *default:*  phpmd  
Github run artifact to put the output files in.

**failure_pattern:** *not required*, *default:*  '"errors":[1-9][0-9]*|"file_errors":[1-9][0-9]*'  
Grep pattern which indicate that the test failed.

**debug:** *not required*, *default:* ''  
Code snippet to generate the debugging code

## Outputs:
none
