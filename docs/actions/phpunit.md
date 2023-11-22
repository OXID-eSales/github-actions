# phpunit
Executes phpunit tests in a running container and uploads the logs as artefacts.

## Inputs:
**container_name:** *not required*, *default:*  php  
Name of the container to run the test in.

**container_options:** *not required*, *default:*  ''  
Options to pass to the container start.

**container_method:** *not required*, *default*: 'exec'  
Whether we use exec to run the command in the existing php container or run to spin up a new one.

**configuration:** *not required*, *default:*  phpunit.xml  
Name of the configuration file.

**test:** *not required*, *default:*  tests/Unit  
Name of the test or folder to run.

**additional_options:** *not required*, *default:*  ''  
Optional: Additional options to pass to phpunit. Example: "--bootstrap bootstrap.xml".

**logfile:** *not required*, *default:*  phpunit_log.txt  
Name of the output logfile.

**logfile_artifact:** *not required*, *default:*  phpunit_logs  
Github run artifact to put the logfile in.

**output_files:** *not required*, *default:* source/unit.cov, source/source/log/oxideshop.log and data/php/logs/error_log.txt  
Output files of the phpunit run to put into the output artifact.

**output_artifact:** *not required*, *default:*  phpunit-artifacts  
Github run artifact to put the output files in.

**coverage_path:** *not required*, *default:*  ''  
Path for the coverage file, not uploaded if it is empty.

**coverage_artifact:** *not required*, *default:* coverage-reports
Github run artifact for the coverage file.

**failure_pattern:** *not required*, *default:*  'fail|\\.\\=\\=|Warning|Notice|Deprecated|Fatal|Error'  
Grep pattern which indicate that the test failed.

## Outputs:
none
