# install_shop

This action first runs oe-console oe:setup:shop, configuring the shop to use
the mysl database in  the mysql container, <http://localhost.local> as shop URL, /var/www/source
as shop-directory and /var/www/source/tmp as compile-directory.

If the input "config_idebug" is set to true, iDebug is activated in source/source/config.inc.php.
If "is_enterprise" is set to true, oe-console is used to activate the Apex theme.

Then, the containers are being stopped and the configuration files are exported as artifact before
caching the shop installation. The action returns the installed shop name as output "installed_shop".

## Inputs

**container_name:** *not required*, *default:*  php  
Name of the container to run the test in.

**container_options:** *not required*, *default:*  ''
Additional options to pass into the container.

**container_method:** *not required*, *default*: 'exec'  
Whether we use exec to run the command in the existing php container or run to spin up a new one.

**is_enterprise:** *not required*, *default:*  false  
This action can be used on the community edition (ce) and enterprise edition (ee) of the shop. On top of setting this to true, a few extra variables/secrets must be provided for using the action on ee.

**config_idebug** *not required*, *default:* false  
Set iDebug to -1 in config.inc.php.

**debug:** *not required*, *default:* false  
Set to true to generate a debugging script.

## Outputs

**installed_shop**  
Name of the cached shop setup.
