# run_test_script

Runs a script defined in a composer.json or availabe as a batch file in tests/Scripts.

## Inputs

**script:** *required*, *no default:*  
Name of the script to run. If the name starts with ~/, this input is interpreted as
the name of a script located in test/Scripts. If not, it is assumed to be defined in
composer.json and will be run as composer \<script\>

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

**output_artifact:** *not required*, *default:*  run_test_script  
Github run artifact for the output.

**debug:** *not required*, *default:* false  
Set to true to generate a debugging script.

## Outputs

None.
