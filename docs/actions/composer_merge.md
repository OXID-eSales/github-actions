# composer_merge
This action takes a json code snippet and merges it with a given composer.json
using the load_testplan action.

## Inputs:
**file:** *required*, *no default*  
Path of the composer.json to modify.

**backup:** *not required*, *true*  
This allows for creation of  a backup of the composer.json, adding the suffix
.bak. Setting this to false disables the backup generation.

**transform:** *required*, *no default*:  
This multiline string must contain a valid json object which will be merged
with the above file.
