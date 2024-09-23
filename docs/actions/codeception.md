# codeception

**Discontinued in v5:**

Executes codeception tests in a running container and uploads the logs and outputs as artifacts.

This has been replaced by using the run_test_script action executing a test script either provided in composer.json or the tests/scripts folder of the repository.

## Inputs

**container_name:** *not required*, *default:*  php  
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

**logfile:** *not required*, *default:*  codeception.txt  
Name of the output logfile.

**output_files:** *not required*, *default:*
    - docker-compose.yml
    - source/composer.json
    - source/composer.lock
    - source/source/config.inc.php
    - source/source/log/oxideshop.log
    - data/php/logs/error_log.txt
    - source/tests/Codeception/_output  
Output files of the codeception run to put into the output artifact.

**output_artifact:** *not required*, *default:*  codeception-artifacts  
Github run artifact to put the output files in.

**coverage_path:** *not required*, *default:*  ''  
Path for the coverage file, not uploaded if it is empty.

**coverage_artifact:** *not required*, *default:* coverage-reports
Github run artifact for the coverage file.

**failure_pattern:** *not required*, *default:*  'fail|\\.\\=\\=|Warning|Notice|Deprecated|Fatal|Error|DID NOT FINISH|Test file ".+" not found|Cannot open file'  
Grep pattern which indicate that the test failed.

**debug:** *not required*, *default:* false  
Set to true to generate a debugging script.

## Outputs

None.
