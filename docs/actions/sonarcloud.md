# sonarcloud
Runs sonarcloud in the given container

## inputs
**container_name:** *not required*, *default:*  php  
Name of the container to run the test in.

**container_options:** *not required*, *default:*  ''  
Additional options to pass into the container.

**container_method:** *not required*, *default*: 'exec'  
Whether we use exec to run the command in the existing php container or run to spin up a new one.

**coverage_artifact:** *not required*, *default:* 'coverage-reports'
Name of the artifact containing the coverage reports.

**target_branch:** *not required*, *default:*  'b-8.0.x'  
Target branch for the scan.

**phpcov_version:** *not required*, *default:*  '8.2.1'  
Version of phpcov to use.

**github_ref_name:** *required*,
Github reference for the scan.

**sonarcloud_organization:** *not required*, *default:*  'oxid-esales'  
Name of the organization in sonarcloud.

**sonarcloud_project_key:** *not required*, *default:*  'OXID-eSales_oxideshop_ce'  
Project key in sonarcloud.

**sonarcloud_project_name:** *not required*, *default:*  'oxideshop_ce_internal'  
Project name in sonarcloud.

**sonarcloud_parameters:** *not required*, *default:*  
    - -Dsonar.language=php \
    - -Dsonar.sources=source \
    - -Dsonar.tests=tests \
    - -Dsonar.sourceEncoding=UTF-8 \
    - -Dsonar.php.coverage.reportPaths=tests/coverage.xml \
    - -Dsonar.cpd.php.minimumTokens=25 \
    - -Dsonar.cpd.php.minimumLines=5  
Parameters passed to the scanner.

**sonar_token:** *required*, *no default*  
Token for Sonarcloud.

**github_token:** *required*, *no default*
Token for Sonarcloud github access.

**output_files:** *not required*, *default:*
    - tests/*
Output files of the sonarcloud run to put into the output artifact.

**output_artifact:** *not required*, *default:*  sonarcloud-artifacts  
Github run artifact to put the output files in.

**debug:** *not required*, *default:* false  
Set to true to generate a debugging script.

## outputs
None.