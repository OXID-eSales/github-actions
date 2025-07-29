# yamllint

Static analyzer for validating YAML files in GitHub Actions.

## Inputs

**file_or_dir** *optional*, *default:* `''`  
File(s) or directory to lint. Separate multiple entries with spaces.

**config_file** *optional*  
Path to a custom configuration file.

**config_data** *optional*  
Custom configuration content (provided as raw YAML).

**format** *optional*, *default:* `parsable`  
Specifies the output format. Options: `parsable`, `standard`, `colored`,
`github`, `auto`.

**strict** *optional*, *default:* `false`  
If set to `true`, the action returns a non-zero exit code for warnings as well
as errors.

**no_warnings** *optional*, *default:* `false`  
If set to `true`, only error-level issues will be reported.

**debug** *optional*, *default:* `''`  
Additional debug information appended to scripts.

## Outputs

The results of the linter.