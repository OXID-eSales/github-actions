# build_docker

This action is used to checkout docker repo and login into dockerhub then build and push docker images.

## Inputs

**dockerhub_username** *required*, *default:* true
Dockerhub username is required to login into Dockerhub.

**dockerhub_password** *required*, *default:* true
Dockerhub password is required to login into Dockerhub.

**image_name** *required*, *default:* true
Image name is required to build and push perticular image.

**tags** *required*, *default:* true
Tags are required for version of the image

**build_args** *required*, *default:* true
build_args are required for matrix versions,There are different build_args for php image.

**debug:** *not required*, *default:* false  
Set to true to generate a debugging script.

## Outputs

None.
