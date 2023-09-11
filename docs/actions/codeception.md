# codeception
Executes codeception tests in a running container and uploads the logs and outputs as artifacts.

## Inputs:
**container:** *not required*, *default:*  php  
Name of the container to run the test in.

**container_options:** *not required*, *default:*  -e SELENIUM_SERVER_HOST=selenium -e BROWSER_NAME=chrome -e THEME_ID=apex  
Additional options to pass into the container.

**container_method:** *not required*, *default*: 'exec'  
Whether we use exec to run the command in the existing php container or run to spin up a new one.

**configuration:** *not required*, *default:*  tests/codeception.yml  
Name of the configuration file.

**build:** *not required*, *default:*  false  
Whether to run the build step before running codeception or not.

**suite:** *not required*, *default:*  acceptance,acceptanceAdmin  
Name of the codeceptioun test suite to run.

**test:** *not required*, *default:*  ''  
Name of a specific test to run.

**additional_options:** *not required*, *default:*  ''  
Optional: Additional options to pass to codeception. Example: "--skip-group flow_theme".

**logfile:** *not required*, *default:*  phpunit_log.txt  
Name of the output logfile.

**logfile_artifact:** *not required*, *default:*  phpunit_logs  
Github run artifact to put the logfile in.

**output_files:** *not required*, *default:*
    - docker-compose.yml
    - source/composer.json
    - source/composer.lock
    - source/source/config.inc.php
    - source/source/log/oxideshop.log
    - data/php/logs/error_log.txt
    - source/tests/Codeception/_output  
Output files of the codeception run to put into the output artifact.

**output_artifact:** *not required*, *default:*  phpunit-artifacts  
Github run artifact to put the output files in.

**coverage_path:** *not required*, *default:*  ''  
Path for the coverage file, not uploaded if it is empty.

**failure_pattern:** *not required*, *default:*  'fail|\\.\\=\\=|Warning|Notice|Deprecated|Fatal|Error|DID NOT FINISH'  
Grep pattern which indicate that the test failed.

## Outputs:
none
