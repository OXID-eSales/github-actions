# append_report
This action adds report and job_status snippets to the testplan artifact.
These are used in the finish action to create the slack notification and the
report on the action summary page.

## Inputs
**header:** *not required*, *default:* false  
If set to "true", a report header for the phase will be generated instead of a
line in the respective table.

**priority:** *not required*, *default:* 000  
Priority helps with sorting phases and table content by becoming part of the file names in the artifact.

**phase:** *required*, *no default:*  
The phase, for which we generate the report. Currently, there are three phases:
- install
- test
- report

**job:** *not required*, *default:* -  
The name of the job, e.g, "phpunit", "codeception" etc.

**title:** *not required*, *default:* -  
The title of the current matrix run. This is usually defined in the job specific testplan, e.g, "unit_tests", "integration_tests" or "shop_setup".

**php:** *not required*, *default:* -  
The PHP version for this matrix combination.

**mysql:** *not required*, *default:* -  
The MySQL version for this matrix combination.

**testplan:** *not required*, *default:* -  
The Testplan used for this matrix combination.

**status:** *not required*, *default:* -  
The job status for this matrix instance.

**debug:** *not required*, *default:* false  
Set to true to generate a debugging script.
