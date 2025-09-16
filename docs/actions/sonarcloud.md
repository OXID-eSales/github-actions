# sonarcloud

Runs SonarCloud analysis with automatic detection and processing of coverage,
PHPUnit, and PHPStan reports.

## Inputs

**coverage_artifact:** *not required*, *default:* 'coverage-reports'  
Name of the artifact containing the coverage reports.

**strip_path:** *not required*, *default:* '/var/www/'  
Path prefix to strip from absolute paths in coverage/report files.

**target_branch:** *not required*, *default:* 'b-8.0.x'  
Target branch for the scan.

**github_ref_name:** *required*  
GitHub reference for the scan.

**sonarcloud_organization:** *not required*, *default:* 'oxid-esales'  
Name of the organization in SonarCloud.

**sonarcloud_project_key:** *not required*, *default:*
'OXID-eSales_oxideshop_ce'  
Project key in SonarCloud.

**sonarcloud_project_name:** *not required*, *default:* 'oxideshop_ce'  
Project name in SonarCloud.

**sonarcloud_parameters:** *not required*, *default:*  
    - -Dsonar.language=php \
    - -Dsonar.sources=source \
    - -Dsonar.tests=tests \
    - -Dsonar.cpd.php.minimumTokens=25 \
    - -Dsonar.cpd.php.minimumLines=5  
Parameters passed to the scanner.

**sonar_token:** *required*, *no default*  
Token for SonarCloud.

**github_token:** *required*, *no default*
Token for SonarCloud GitHub access.

**output_files:** *not required*, *default:* 'tests/*'  
Output files of the sonarcloud run to put into the output artifact.

**output_artifact:** *not required*, *default:* 'sonarcloud-artifacts'  
GitHub run artifact to put the output files in.

**run_cleanup:** *not required*, *default:* true
Whether to clean up coverage artifacts after processing. Set to false for
parallel jobs to prevent race conditions.

**debug:** *not required*, *default:* ''  
Set to true to generate a debugging script.

## Outputs

None.
