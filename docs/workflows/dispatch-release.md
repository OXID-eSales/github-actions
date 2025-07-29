# dispatch_release

This workflow automates the release procedure. Triggering this workflow runs the
following steps:

- Checks if the provided tag, `v<major>.<minor>.<patch>` already exists.
- Checks out the given branch and merges the `main` branch into it.
- Scans all YAML files in the checked-out repository for references matching
`OXID-eSales/github-actions/*`, and updates any `@v<version>` references to
`@v<major>` using the provided major version input.
- Creates a feature branch named `release_<major>_<minor>_<patch>` and opens a
pull request to merge that branch back into the `main` branch. 
  - The selected reviewer will receive an automatic notification.

## Inputs

**feature_branch** *optional*, *default:* `''`  
Name of the feature branch. If left empty, the current branch will be used.

**major** *required*, *no default*  
Major version number (X.?.?)

**minor** *required*, *no default*  
Minor version number (?.X.?)

**patch** *required*, *no default*  
Patch version number (?.?.X)

**reviewer** *required*, *no default*  
GitHub username of the person who should review the pull request.  
Available options:
- kenariosz
- joernott
