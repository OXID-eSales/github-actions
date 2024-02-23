# slack_status
Facilitates sending messages to a slack channel. Using this action, you don't need to worry about gathering the
overall status across multiple jobs or properly formatting the json payload. The overall status is the highest
status of any of the jobs using the order skipped > success > cancelled > failure.

# Inputs:
**slack_webhook:** *required*, *no default*  
URL for the channel web hook, see https://api.slack.com/apps/A04CAPK58G0/incoming-webhooks?.

**title:** *required*, *no default*  
Title for the message, an emoji in front and the overall status at the end will be added

**summary_list:** *not required*, *default:* ''  
A list of short captions (without spaces) separated from an URL by a %. These will be printed directly below the title

**install_list:** *not required*, *default:* ''  
A list of short job names (without spaces) separated from the jobs result by a %. These will be printed in two columns below
the summary. Use either ${{ steps.step_name.outcome }} for the results of other steps within the same job or ${{ needs.job_name.result }}
for the results of another job. Don't forget to add that job to "needs" for the current one.

**test_list:** *not required*, *default:* ''  
A list of short job names (without spaces) separated from the jobs result by a %. These will be printed in two columns below
the summary. Use either ${{ steps.step_name.outcome }} for the results of other steps within the same job or ${{ needs.job_name.result }}
for the results of another job. Don't forget to add that job to "needs" for the current one.

**report_list:** *not required*, *default:* ''  
A list of short job names (without spaces) separated from the jobs result by a %. These will be printed in two columns below
the summary. Use either ${{ steps.step_name.outcome }} for the results of other steps within the same job or ${{ needs.job_name.result }}
for the results of another job. Don't forget to add that job to "needs" for the current one.

**debug:** *not required*, *default:* false  
Set to true to generate a debugging script.
