# begin_report
This action adds small header snippets to the testplan artifact. The snippets
are used in the finish action to create the slack notification and the report
on the action summary page.

## Inputs
**repository:** *required*, *no default*  
The name of the github repository starting the workflow. Tis is usually
'${{ github.server_url }}/${{ github.repository }}'.

**job:** *not required*, *default:* -  
URL for the gihub actions job. This is usually '${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}'

**testplan:** *not required*, *default:* -  
URL or file name for the test plan. This is usually '${{ inputs.testplan }}' 

**title:** *not required*, *default:* default  
Title used for the slack report/Github report. It is recommended to use the
same as the title for the slack notification. This is usually
${{ steps.ltp.outputs.finish_slack_title }}.
