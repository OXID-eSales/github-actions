# load_cached_testplan

Fetches the testplan and sets environment variables accordingly.

## Inputs

**runs_on** *required*  
JSON string or array describing the runner.

**php** *optional*, *default:* `8.2`  
Version of PHP for this instance.

**mysql** *optional*, *default:* `mysql-8.0.36`  
Version of MySQL for this instance.

**prefix** *required*  
Prefix for the testplan artifact name.

**root_testplan** *required*  
Base testplan list.

**matrix_testplan** *required*  
Matrix-specific test plans to add.

**plan_folder** *required*  
Name of the cached testplan folder.

**cache_name** *required*  
Name of the cached testplan object.

**cache_bucket** *optional*, *default:* `oxideshop-ee`  
Name of the local S3 cache bucket.

**cache_endpoint** *optional*, *default:* `''`  
Value for `secrets.CACHE_ENDPOINT` used by actions-cache.

**cache_access_key** *optional*, *default:* `''`  
Value for `secrets.CACHE_ACCESS_KEY` used by actions-cache.

**cache_secret_key** *optional*, *default:* `''`  
Value for `secrets.CACHE_SECRET_KEY` used by actions-cache.

**debug** *optional*, *default:* `''`  
Additional debug information appended to scripts.

## Outputs

### Workflow-related variables

**testplan**  
Final resolved testplan list.

**matrix_suffix**  
Suffix for this matrix run, consisting of the PHP and MySQL versions.
