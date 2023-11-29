# load_testplan
> [!WARNING]
> This action is deprecated and will be removed with v4. Use joernott/load_testplan@v1 instead.

Loads a yaml file describing the test plan and sets environment variables

## inputs
**testplan:** *required*, *no default*  
URL/file name of the yaml file to load.

**repository:** *not required*, *default:* ''  
Optional name of the repository to check out. Needed, if "testplan" is not a URL

**ref:** *required*, *default:* ''  
Branch, tag or hash of the commit to check out

**override:** *required*, *default:* ''  
Optional YAML code to override the testplan.

## outputs
None