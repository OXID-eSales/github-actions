# cleanup_workspace
This action cleans the runner workspace, optionally kills running docker
containers and removes finished docker containers and unused images. The
behaviour can be controlled by its inputs.

## Inputs
**clean_workspace:** *not required*, *default:* true  
The action removes all files and directories in the workspace by default.
Set to false to skip this step.

**kill_containers:** *not required*, *default:* false  
If set to true, all running containers will be killed. If you use ACT,
this might result in killing the container the action runs in, thus failing it.

**prune_docker:** *not required*, *default:* true  
This runs 'docker prune -f' to remove terminated containers and unused
images. Set to false if you still need to access them.

**debug:** *not required*, *default:* false  
Set to true to generate a debugging script.
