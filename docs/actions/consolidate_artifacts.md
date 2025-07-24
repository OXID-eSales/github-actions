# consolidate_artifacts

This action fetches multiple artifacts and consolidates them into one single
artifact. If that single artifact existed before, it will be downloaded and
removed before the others are downloaded. This simulates the updating mechanism
which was available with upload-artifact in version 3.

## Inputs

**target:** *required*, *no default*  
This is the name of the final consolidated artifact. If it already exists, it
will be downloaded, then deleted and in the end recreated.

**pattern:** *required*, *no default:  
Pattern of artifact names to download.

**path:** *not required*, *default:* './'  
The path to download the artifacts into.

## Outputs

None.
