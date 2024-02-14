# styles
Runs composer phpstan-reports, phpmd-reports and phpcs on the test-module folder.

## Inputs:
**container_name:** *not required*, *default:*  php  
Name of the container to run the test in.

**container_options:** *not required*, *default:*  ''  
Options to pass to the container start.

**container_method:** *not required*, *default*: 'exec'  
Whether we use exec to run the command in the existing php container or run to spin up a new one.

**path:** *not required*, *default:* .  
A multiline or space separated list of folders to run the scans in.

**output_files:** *not required*, *default:* source/test-module/tests/reports/phpstan.report.json source/test-module/tests/reports/phpmd.report.json  
Output files of the code analysis to put into the output artifact.

**output_artifact:** *not required*, *default:*  StylesLog  
Github run artifact to put the output files in.

**debug:** *not required*, *default:* false  
Set to true to generate a debugging script.

## Outputs:
none
