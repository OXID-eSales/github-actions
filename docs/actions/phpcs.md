# phpcs
Executes php code sniffer tests in a running container and uploads the logs as artefacts.

## Inputs:
**container_name:** *not required*, *default:*  php  
Name of the container to run the test in.

**container_options:** *not required*, *default:*  ''  
Options to pass to the container start.

**container_method:** *not required*, *default*: 'exec'  
Whether we use exec to run the command in the existing php container or run to spin up a new one.

**diff_only:** *not required*, *default:*  true
Check only the files changed between the actual ref and the previous commit.

**git_ref:** *not required*, *default:* 'main'  
Reference for comparing with the base reference to get a list of changed files. Use ${{ github.ref }} to check files changed in your PR/Commit.

**filter:** *not required*, *default:*  '\.php$'
Filter the file names against this regex.

**additional_options:** *not required*, *default:*  '-q --standard=PSR12'  
Optional: Additional options to pass to phpcs. Example: "-q --standard=PSR12".

**logfile:** *not required*, *default:*  phpcs_log.txt  
Name of the output logfile.

**logfile_artifact:** *not required*, *default:*  phpunit_logs  
Github run artifact to put the logfile in.

**failure_pattern:** *not required*, *default:*  'fail|\\.\\=\\=|Warning|Notice|Deprecated|Fatal|Error'  
Grep pattern which indicate that the test failed.

## Outputs:
none
